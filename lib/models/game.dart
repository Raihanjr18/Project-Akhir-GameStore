import 'package:cloud_firestore/cloud_firestore.dart';


class Game{
  String name;
  String price;
  String rating;
  String summary;
  String image;
  String background;

  Game({
  required this.name,
  required this.price,
  required this.rating,
  required this.summary,
  required this.image,
  required this.background
});

Map<String, Object> toJson(){
  return{
    "name" : this.name,
    "price" : this.price,
    "rating" : this.rating,
    "summary" : this.summary,
    "image" : this.image,
    "background" : this.background
  };
}

factory Game.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json){
  return Game(
    name: json['name'], 
    price: json['price'], 
    rating: json['rating'], 
    summary: json['summary'], 
    image: json['image'],
    background: json['background']);
}
}

