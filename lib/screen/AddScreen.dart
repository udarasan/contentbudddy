import 'package:contentbudddy/helper/Db_helper.dart';
import 'package:contentbudddy/model/Contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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
                  await Db_helper.instance.add(
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
                child:  Text('Add New Contact'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
                  elevation: 5,
              ),
            )

          ],
        )




        /*TextFormField(
            decoration: const InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Enter Your Name'
            ),
            controller: textController,
          ),*/



      )

    );
  }

}

