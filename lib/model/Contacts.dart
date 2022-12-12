import 'dart:convert';

class Contacts{
  final int? id;
  final String name;
  final String number;
  final String? email; // null enable can using ? mark
  final String? imgPath; // null enable can using ? mark

  Contacts({this.id, required this.name,required this.number, this.email,this.imgPath,});

  factory Contacts.fromMap(Map<String,dynamic>json)=> Contacts(
      id:json['id'],
      name:json['name'],
      number:json['number'],
      email:json['email'],
      imgPath:json['imgPath'],
      );

Map<String,dynamic> toMap(){
  return{
    'id':id,
    'name':name,
    'number':number,
    'email':email,
    'imgPath':imgPath,

  };
}
}