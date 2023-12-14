import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamestore/models/game.dart';
import 'package:gamestore/views/shopping_page.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatelessWidget {
  
Future<void> addToShoppingCart(BuildContext context) async {
  try{
    // inisialisasi Firestore
    FirebaseFirestore firestore =FirebaseFirestore.instance;

    // koleksi "shopping_cart" dan tambahan data
    await firestore.collection('shooping_cart').add({
      'name': selectedGame!.name,
      'price': selectedGame!.price,
      'image': selectedGame!.image,

    });
    // tampilan pesan sukses atau lakukan suatu setelah berhasil disimpan
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Barang Berhasil Ditambahkan',
      btnOkOnPress: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=> Shoppingpage()),
          );
      },
    ).show();
  } catch (e){
    print('Error: $e');
  }
}

final Game? selectedGame;

Detail({required this.selectedGame});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView (
        slivers: [
          // bagian background
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.network('${selectedGame!.background}',
              fit: BoxFit.cover,),
             ),
          ), 
            //bagian detail game 
        SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,16.0,0,16.0),
                  child: Row(
                    children: [
                      // gambar game
                      Card(
                        child: SizedBox(
                          width: 100.0, 
                          child: Image.network(
                              '${selectedGame!.image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${selectedGame!.name}',//data nama game
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 8.0),
                                Text(
                                  '${selectedGame!.rating}', // data rating game
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Rp. ${selectedGame!.price}', //data harga game
                              style: TextStyle(fontSize: 18.0, color: const Color.fromRGBO(76, 175, 80, 1)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0), 
                  child: Container(
                    height: 45,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(76, 175, 80, 1)),
                      ),
                      // action menambahkan game ke shooping cart
                      onPressed: () async {
                        await addToShoppingCart(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), 
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary', 
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0), 
                      ReadMoreText(
                        '${selectedGame!.summary}',//data summary game
                        trimLines: 4,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(76, 175, 80, 1)
                        ),
                          moreStyle:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(76, 175, 80, 1)
                         ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        )
        ]
      )
    );

        }
      }