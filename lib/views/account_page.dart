import 'package:flutter/material.dart';

class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile',
      home: UserProfilPage(),
    );
  }
}

class UserProfilPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text(
          'Your Profil',
          style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold),
          ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(top: 2),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/raihan.jpg'),
              ),
              SizedBox(height:20),
              Padding(padding: const EdgeInsets.fromLTRB(20.0,0,20.0,0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Text(
                'Raihan Surya',
                style: TextStyle(
                  color: Color.fromARGB(192, 36, 182, 75),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                )
              ]
              ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0,0,16.0,0),
                child: Column(
                  children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: Color.fromARGB(192, 36, 182, 75),),
                title: Text('raihanbae936@gmail.com'),
              ),
              ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Color.fromARGB(192, 36, 182, 75),),
                title: Text('+6282819101010'),
              ),
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}