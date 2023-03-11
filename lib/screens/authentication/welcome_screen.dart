import 'package:flutter/material.dart';

import 'auth_page.dart';

class welcome_screen extends StatelessWidget {
  const welcome_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 159,),
          Center(
            child: Image.asset("assets/images/logo1.png", height: size.height*0.23,),
          ),
          SizedBox(height: 25,),
          Center(child: Text("Fragrance of Mastership",
              style: Theme.of(context).textTheme.headlineMedium)),
          SizedBox(height: 10,),
          Text("Discover, Immerse, and Find Inspiration \nIn the World of Islamic Hadiths!" , textAlign: TextAlign.center,),
          // Text("Get Closer to Islamic Wisdom"),
          SizedBox(height: 200,), //default 300
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 3,
              //backgroundColor: darkDynamic?.primary.withOpacity(1) ?? Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minimumSize: Size(300, 50), //////// HERE
            ),
            onPressed: () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => auth_list()));},
            child: Text('Get Started', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          )
        ],
      ),
    );
  }
}
