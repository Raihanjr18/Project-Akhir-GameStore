import 'package:cloud_firestore/cloud_firestore.dart';


class User{
  String name;
  String email;
  String telepon;
  String image;

  User({
  required this.name,
  required this.email,
  required this.telepon,
  required this.image,
});

Map<String, Object> toJson(){
  return{
    "name" : this.name,
    "email" : this.email,
    "telepon" : this.telepon,
    "image" : this.image,
  };
}

factory User.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json){
  return User(
    name: json['name'],
    email : json['email'],
    telepon: json['telepon'],
    image: json['image'],
    );
}
}

