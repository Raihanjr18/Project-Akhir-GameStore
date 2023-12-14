import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamestore/models/shooping_cart.dart';


class Shoppingpage extends StatelessWidget {
 
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text(
          'Your Shopping',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold)
          ),
        backgroundColor: Color.fromARGB(192, 36, 182, 75),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)), 
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
      body: MyListView(),
      bottomNavigationBar: Container(
        height: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      // borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('shooping_cart').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData || snapshot.data == null) {
                return CircularProgressIndicator();
              }

              List<Shop> shopList = snapshot.data!.docs.map((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Shop(
                  name: data['name'] ?? '',
                  price: data['price'] ?? '',
                  image: data['image'] ?? '',
                  documentId: doc.id,
                );
              }).toList();

              // Hitung total harga
              double totalprice = 0;
              void calculateTotalPrice() {
                totalprice = 0;
                for (Shop shop in shopList) {
                  totalprice += double.parse(shop.price);
                }
              }
            return Text(
              'Total: Rp ${totalprice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            );
            },
           ),
            ElevatedButton(
              onPressed: () {
                // tindakan saat tombol checkout diklik
              },
              child: Text('Checkout'),
            ),
          ],
      ),
      ),
    );
    
 }
}

class MyListView extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('shooping_cart').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      return Text('error : ${snapshot.error}');
    }
    if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData || snapshot.data == null) {
      return CircularProgressIndicator();
    }
    List<Shop> shopList = snapshot.data!.docs.map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Shop(
        name: data['name'] ?? '',
        price: data['price'] ?? '',
        image: data['image'] ?? '', 
        documentId: doc.id,
      );
    }).toList();
    
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      itemCount: shopList.length,
      itemBuilder: (BuildContext context, int index) {
        //dapatkan ID dokument dari snapshot firestore
        var id = snapshot.data!.docs[index].id;
        return Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child : SizedBox(
            height: 80,
          child : ListTile(
            //tampilkan gambar barang
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(shopList[index].image,
              fit: BoxFit.cover,),
            ),
            //tampilkan nama barang
            title: Padding(
              padding: EdgeInsets.only(top: 10.0,left: 5.0),
            child : Text(
              shopList[index].name,
              style: TextStyle(fontSize: 14),
            ),
            ),
            //tampilkan harga barang
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5,left: 5.0),
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 'Rp. ${shopList[index].price}',
                 style: TextStyle(fontSize: 12),
                ),
                Text(
                 '',
                 style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            ),
            //tombol hapus barang
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red,),
              onPressed: (){
                AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.scale,
                showCloseIcon: true,
                title: 'Barang Berhasil dihapus',
                btnOkOnPress: (){
                  shopList[index].deleteItem(id);
                  },
                )..show();
              }, 
              ),
          ),
          ),
        );
      },
    );
    },
  );
 }
}