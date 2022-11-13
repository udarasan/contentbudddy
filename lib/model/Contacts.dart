import 'dart:convert';

class Contacts{
  final int? id;
  final String name;
  final String number;
  final String? email; // null enable can using ? mark

  Contacts({this.id, required this.name,required this.number, this.email});

  factory Contacts.fromMap(Map<String,dynamic>json)=> Contacts(
      id:json['id'],
      name:json['name'],
      number:json['number'],
      email:json['email'],
      );

Map<String,dynamic> toMap(){
  return{
    'id':id,
    'name':name,
    'number':number,
    'email':email,
  };
}
}