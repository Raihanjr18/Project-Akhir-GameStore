import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gamestore/models/game.dart';
import 'package:gamestore/views/detail.dart';
import 'package:gamestore/views/shopping_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//list gambar untuk carousel slider
final List<String> imgList = [
  'assets/slide_game/eafc24.jpg',
  'assets/slide_game/god of war.jpg',
  'assets/slide_game/mortal combat.jpg',
  'assets/slide_game/tekken.jpg',
];

//widget untuk setiap gambar dalam carousel slider
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          elevation: 8,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Container(
            margin: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
            child: Image.asset(
              'assets/logo.jpg',
              width: 40.0,
              height: 70.0,
            ),
          ),
          //icon shooping cart
      actions: [
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
        child: IconButton(
          icon: Icon(Icons.shopping_cart,
          color: Colors.black,
          weight: 50.0,),
          onPressed: (){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => Shoppingpage()),
              );
          } ),
        ),
      ],
      ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar untuk CarouselSlider
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: Color.fromARGB(192, 36, 182, 75),
            flexibleSpace: FlexibleSpaceBar(
              background: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: true,
                ),
                items: imageSliders,
              ),
            ),
          ),
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection('game').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                 child: Center(
                    child: CircularProgressIndicator(),
                 ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                 child: Center(
                    child: Text('Error: ${snapshot.error}'),
                 ),
                );
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return SliverToBoxAdapter(
                 child: Center(
                    child: Text('No data available.'),
                 ),
                );
              } else {
                var games = snapshot.data!.docs
                    .map((game) => Game.fromSnapshot(game))
                    .toList();
                return SliverGrid(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 12.0 / 18.0,
                 ),
                 delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var game = games[index];
                      return Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(selectedGame: games[index],),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 4.0 / 5.0,
                                child:
                                Image.network (game.image,
                                 fit: BoxFit.cover,
                                ),
                                ),
                              SizedBox(height: 6.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 2.0),
                                child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                    Text(
                                      game.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.0,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Text(
                                      'Rp. ${game.price}',
                                      style: TextStyle(
                                        fontSize: 9.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                 ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: games.length,
                 ),
                );
              }
            },
          ),
        ]
      ),
    );
  }
}
