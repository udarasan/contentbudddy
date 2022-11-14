import 'package:flutter/material.dart';
import 'package:contentbudddy/helper/Db_helper.dart';
import 'package:contentbudddy/model/Contacts.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class EditScreen extends StatefulWidget {

  const EditScreen(this.id,this.name,this.number,this.email,{Key? key, }) : super(key: key);

  final int ?id;
  final String name;
  final String number;
  final String ?email;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {


  final name1 = TextEditingController();
  final number1 = TextEditingController();
  final email1 = TextEditingController();


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
                  initialValue: widget.name,
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
                  initialValue: widget.number,
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
                  initialValue: widget.email,
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
                            id: widget.id,
                            name: widget.name,
                            number: widget.number,
                            email: widget.email
                        )
                    );
                    setState(() {

                      name1.clear();
                      number1.clear();
                      email1.clear();

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

