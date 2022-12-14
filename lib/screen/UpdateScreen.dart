import 'dart:io';

import 'package:contentbudddy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contentbudddy/helper/Db_helper.dart';
import 'package:contentbudddy/model/Contacts.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen(this.id,this.name,this.number,this.email,this.imagePath,{Key? key}) : super(key: key);

  final int ?id;
  final String name;
  final String number;
  final String ?email;
  final String imagePath;
  @override
  Widget build(BuildContext context) {

    final name1 = TextEditingController(text:name);
    final number1 = TextEditingController(text: number);
    final email1 = TextEditingController(text: email);

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top: 70.0,left: 20.0,right: 30.0,bottom: 10.0),
            child: Column(
              children: [
                Container(
                  child: ClipOval(
                      child:Image.file(File(imagePath),fit: BoxFit.cover,width: 90,height: 90,)
                  ),
                ),
                TextFormField(
                  controller: name1,
                  //initialValue: widget.name,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    labelText: 'Contact Name',
                    helperText: 'Contact Name',
                    suffixIcon: const Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                TextFormField(
                  //initialValue: widget.number,
                  controller: number1,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.phone),
                    labelText: 'Contact Number',
                    helperText: 'Contact Number',
                    suffixIcon: const Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                TextFormField(
                  //initialValue: widget.email,
                  controller: email1,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  decoration:  InputDecoration(
                    icon: const Icon(Icons.email),
                    labelText: 'Contact Email',
                    helperText: 'Contact Email',
                    suffixIcon: const Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () async {
                    await Db_helper.instance.update(
                        Contacts(
                            id: id,
                            name: name1.text,
                            number: number1.text,
                            email: email1.text,
                            imgPath:imagePath
                        )
                    );

                      name1.clear();
                      number1.clear();
                      email1.clear();
                      Navigator.pop(context, true);

                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    onSurface: Colors.grey,
                    elevation: 5,
                  ),
                  child:  const Text('Update Contact'),
                )
              ],
            )
        )
    );
  }
}
