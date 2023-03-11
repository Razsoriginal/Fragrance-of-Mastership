import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fragrance/widgets/hadith_card.dart';

class cat_following extends StatefulWidget {
  const cat_following({Key? key}) : super(key: key);

  @override
  State<cat_following> createState() => _cat_followingState();
}

class _cat_followingState extends State<cat_following> {
  List data = [];
  List list = [];

  Future<void> loadJson() async {
    data = json.decode(
        await DefaultAssetBundle.of(context).loadString("assets/Books.json"));

    setState(() {
      for (int i = 0; i < data.length; i++) {
        list.add(data[i]["EnglishTitle"]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [],);
    /*FutureBuilder(builder: (context, snapshot) {
      var showData = json.decode(snapshot.data.toString());
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return hadith_card(
                title: showData[index]['EnglishTitle'],
                hadith_by: "Imam (as)",
                arabic: showData[index]['Arabic'],
                eng: showData[index]['EnglishTranslation'],
                urdu: showData[index]['UrduTranslation'],
                istranslation: 3,
                descp: showData[index][''],
                refeng: refeng,
                refurdu: refurdu, mins: mins)
          }, 
          separatorBuilder: separatorBuilder, itemCount: itemCount)
    });*/
  }
}
