import 'package:cloud_firestore/cloud_firestore.dart';

class Shop{
  String name;
  String price;
  String image;
  String documentId;
  

  Shop({
  required this.name,
  required this.price,
  required this.image,
  required this.documentId
});

Map<String, Object> toJson(){
  return{
    "name" : this.name,
    "price" : this.price,
    "image" : this.image,
    "documentId" : this.documentId
  };
}

Future<void> deleteItem(String id) async {
  await FirebaseFirestore.instance.collection('shooping_cart').doc(id).delete();
}

factory Shop.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json){
  return Shop(
    name: json['name'], 
    price: json['price'], 
    image: json['image'],
    documentId: json.id);
}

}




