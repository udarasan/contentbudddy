import 'package:flutter/material.dart';
import 'package:contentbudddy/helper/Db_helper.dart';
import 'package:contentbudddy/model/Contacts.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final name = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Container(
            padding: const EdgeInsets.only(top: 70.0,left: 20.0,right: 30.0,bottom: 10.0),
            child: Column(
              children: [
                const ProfilePicture(
                  tooltip: true,
                  name: 'Dees',
                  radius: 31,
                  fontsize: 21,
                ),
                TextFormField(
                  controller: name,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Contact Name',
                    helperText: 'Contact Name',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                TextFormField(
                  controller: number,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Contact Number',
                    helperText: 'Contact Number',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                TextFormField(
                  controller: email,
                  cursorColor: Colors.teal,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Contact Email',
                    helperText: 'Contact Email',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () async {
                    await Db_helper.instance.update(
                        Contacts(
                            name: name.text,
                            number: number.text,
                            email: email.text
                        )
                    );
                    setState(() {

                      name.clear();
                      number.clear();
                      email.clear();

                      Navigator.pop(context, true);
                    });
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

