import 'package:flutter/material.dart';
import 'package:fragrance/providers/share_tradition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hadith_card extends StatelessWidget {
  String title;
  String hadith_by;
  String arabic;
  String eng;
  String urdu;
  int istranslation; // 1 for only eng, 2 for urdu, 3 for eng + urdu
  String descp;
  List <String> refeng;
  List <String> refurdu;
  String mins;

  hadith_card({Key? key, required this.title, required this.hadith_by, required this.arabic, required this.eng, required this.urdu, required this.istranslation, required this.descp, required this.refeng, required this.refurdu, required this.mins}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(title, style: TextStyle(fontSize: 20),),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Row(children: [
                          Text(hadith_by, style: TextStyle(),),
                          Icon(Icons.star_rate_rounded, size: 18, color: Colors.amber,)
                          ],
                        ),
                      ]),
                      Row(children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined)),
                        PopupMenuButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            itemBuilder: (context) {return [
                              PopupMenuItem(child: Row(children: const [Icon(Icons.note_add_outlined, size: 18,) , Text("  Add note", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                              PopupMenuItem(child: Row(children: const [Icon(Icons.copy, size: 18,) , Text("  Copy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                              PopupMenuItem(child: Row(children: const [Icon(Icons.share_outlined, size: 18,) , Text("  Share", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                            ];
                            }),
                      ],)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => hadith_page(title: title, hadith_by: hadith_by, arabic: arabic, eng: eng, urdu: urdu, istranslation: istranslation, descp: descp, refeng: refeng, refurdu: refurdu, mins: mins)));
      },
    );
  }
}

class hadith_page extends StatefulWidget {
  String title;
  String hadith_by;
  String arabic;
  String eng;
  String urdu;
  int istranslation; // 1 for only eng, 2 for urdu, 3 for eng + urdu
  String descp;
  List <String> refeng;
  List <String> refurdu;
  String mins;
  hadith_page({Key? key,  required this.title, required this.hadith_by, required this.arabic, required this.eng, required this.urdu, required this.istranslation, required this.descp, required this.refeng, required this.refurdu, required this.mins}) : super(key: key);

  @override
  State<hadith_page> createState() => _hadith_pageState();
}

class _hadith_pageState extends State<hadith_page> {

  late ShareTradition tradition;
  late SharedPreferences _prefs;
  bool _isArabic = true;
  bool _showTrans = true;
  bool _isTrans_Eng = true;
  bool _isTrans_Urdu = true;
  double _arabic_size = 30;
  double _trans_size = 17;

  int _index = 0;
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  void initState() {
    super.initState();
    _pageSettings();
    tradition = ShareTradition(title: widget.title, hadithBy: widget.hadith_by, arabic: widget.arabic, eng: widget.eng, urdu: widget.urdu, description: widget.descp, refEng: widget.refeng, refUrdu: widget.refurdu, );
  }

  void _pageSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isArabic = _prefs.getBool('isArabic') ?? true;
      _showTrans = _prefs.getBool('showTrans') ?? true;
      _isTrans_Eng = _prefs.getBool('isTrans_Eng') ?? true;
      _isTrans_Urdu = _prefs.getBool('isTrans_Urdu') ?? true;
      _arabic_size = _prefs.getDouble('arabic_size') ?? 30;
      _trans_size = _prefs.getDouble('trans_size') ?? 17;
    });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
        ),
        builder: (BuildContext context) {
          // return your layout
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              children: [
                /*Row(children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.close_sharp)),
                  Text("Hadith Refrences ", style: Theme.of(context).textTheme.titleLarge),
                  Icon(Icons.star_rate_rounded, color: Colors.amber,)
                  ],
                ),
                Divider(),
                SizedBox(height: 5,),*/
                Center(
                  child: Container(height: 7, width: 130,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor,),
                  ),
                ), SizedBox(height: 25,),
                Row(children: [
                      Text("Hadith Refrences ", style: Theme.of(context).textTheme.titleLarge),
                      Icon(Icons.star_rate_rounded, color: Colors.amber,),
                    ],
                  ),
                Divider(),
                SizedBox(height: 10,),
                Row(children: [Text(widget.refeng.join('\n \n'), style: Theme.of(context).textTheme.titleSmall,),], ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                Column( children: [Text(widget.refurdu.join('\n'),  style: TextStyle(fontFamily: 'Jameel', fontSize: 25), textAlign: TextAlign.right,),], ),
                SizedBox(height: 25,), Text(" "),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context);},),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined)),
          IconButton(onPressed: () { _showModalBottomSheet(); }, icon: Icon(Icons.book_outlined)), // refrences bottom sheet
          IconButton(onPressed: () { showDialog(context: context,
            builder: (BuildContext context) {return tradition; });},
              icon: Icon(Icons.ios_share_rounded)),
          PopupMenuButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              itemBuilder: (context) {return [
                PopupMenuItem(child: Row(children: const [Icon(Icons.note_add_outlined, size: 18,) , Text("  Add note", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                PopupMenuItem(child: Row(children: const [Icon(Icons.copy, size: 18,) , Text("  Copy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                PopupMenuItem(child: Row(children: const [Icon(Icons.share_outlined, size: 18,) , Text("  Share", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
              ];
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(widget.title, style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10,),
                    Text(widget.descp, style: TextStyle(fontSize: 17), textAlign: TextAlign.left,),
                    SizedBox(height: 10,),

                    // Hadith Arabic
                    if (_isArabic) Column(children: [
                        Directionality( textDirection: TextDirection.rtl,
                            child: Text(widget.arabic, textAlign: TextAlign.right, style: TextStyle(fontFamily: 'arabic', fontSize: _arabic_size, height: 2,),)),
                        SizedBox(height: 10,),],),

                    // Text("Translation",),
                    SizedBox(height: 10,),
                    if (_showTrans) Column(children: [
                      if (_isTrans_Eng) Column(children: [
                          Text(widget.eng, style: TextStyle(fontSize: _trans_size), textAlign: TextAlign.left,),
                          SizedBox(height: 20,),
                        ],),

                      if (_isTrans_Urdu) Column(children: [
                        SizedBox(height: 10,),
                          Text(widget.urdu,  style: TextStyle(fontFamily: 'Jameel', fontSize: _arabic_size - 5), textAlign: TextAlign.right,),
                          SizedBox(height: 10,),
                        ],),
                    ],),

                    Divider(),
                  ]
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17),
                      child: Text("Recommended Hadiths", style: Theme.of(context).textTheme.titleLarge,),
                    ),
                    SizedBox(height: 7,),
                    // hadith_card(),
                    hadith_card(title: "The importance of learning traditions of the Ahle Bait(a.s.)",
                        hadith_by: "Imam Reza (a.s.)",
                        arabic: "عَنِ الْهَرَوِيِّ قَالَ سَمِعْتُ أَبَا الْحَسَنِ عَلِيَّ بْنَ مُوسَى الرِّضَا ع يَقُولُ رَحِمَ اللَّهُ عَبْداً أَحْيَا أَمْرَنَا فَقُلْتُ لَهُ وَ كَيْفَ يُحْيِي أَمْرَكُمْ قَالَ يَتَعَلَّمُ عُلُومَنَا وَ يُعَلِّمُهَا النَّاسَ فَإِنَّ النَّاسَ لَوْ عَلِمُوا مَحَاسِنَ كَلَامِنَا لَاتَّبَعُونَا",
                        eng: "“He learns our knowledge (traditions) and teaches it to the people. Surely, if people knew the beauty of our words, they would certainly follow us.”",
                        urdu: "‘‘ہمارے علوم (احادیث) سیکھ کر اور لوگوں کو ان کی تعلیم دے کر۔ یقیناً اگر لوگ ہمارے کلام کی خوبصورتی کو جان جاتے تو ضرور بالضرور ہماری اتباع و پیروی کرتے۔ ’’",
                        istranslation: 3,
                        descp: "Abd al-Salaam Ibn Saaleh al-Harawiyy said: I heard Imam Reza (a.s.) say, “May Allah have mercy on the person who enlivens our affair (i.e. Wilayat)!” I asked, “How is your affair enlivened?” He (a.s.) informed,",
                        refeng: ["Oyoon al-Akhbaar al-Reza (a.s.), vol. 1, p. 307, H. 69", "Maani al-Akhbaar, p. 180, H. 1", "Wasaael al-Shiahh, vol. 27, p. 92, H. 33297", "Behaar al-Anwaar, vol. 2, p. 30, H. 13"],
                        refurdu: ["عیون اخبار الرضا،ج:۱ ،ص: ۳۰۷ ،ح :۶۹", "معانی الاخبار، ص :۱۸۰، ح: ۱", "وسائل الشیعہ ،ج :۲۷ ، :۹۲ :ح :۳۳۲۹۷", "بحار الانوار ،ج :۲ :ص :۳۰ ،ح: ۱۳"],
                        mins: "5"),

                    hadith_card(title: "True knowledge can be obtained only from the Ahle Bait(a.s.)",
                        hadith_by: "Imam Abu Ja’far (al-Baqer) (a.s.)",
                        arabic: ".قَالَ أَبُو جَعْفَرٍ ع لِسَلَمَةَ بْنِ كُهَيْلٍ وَ الْحَكَمِ بْنِ عُتَيْبَةَ شَرِّقَا وَ غَرِّبَا فَلَا تَجِدَانِ عِلْماً صَحِيحاً إِلَّا شَيْئاً خَرَجَ مِنْ عِنْدِنَا أَهْلَ الْبَيْتِ",
                        eng: "“Both of you go East or West, you will not find true knowledge except that which has emanated from us Ahle Bait (a.s.).”",
                        urdu: "‘‘تم دونوں چاہے مشرق کی طرف چلے جاؤ یا مغرب کی طرف ، تم صحیح علم نہیں پاسکو گے، سوائےاس کے کہ جو (علم) ہم اہل بیت علیہم السلام سے آیا ہو۔’’",
                        istranslation: 3,
                        descp: "Imam Abu Ja’far (al-Baqer) (a.s.) said to Salamah Ibn Kuhail and al-Hakam Ibn Otaibah (two well-known Batris),",
                        refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
                        refurdu: ["عیون اخبار الرضا،ج:۱ ،ص: ۳۰۷ ،ح :۶۹", "معانی الاخبار، ص :۱۸۰، ح: ۱", "وسائل الشیعہ ،ج :۲۷ ، :۹۲ :ح :۳۳۲۹۷", "بحار الانوار ،ج :۲ :ص :۳۰ ،ح: ۱۳"],
                        mins: "3"),

                    hadith_card(title: "Is guidance possible except from those in whose houses the Revelation has descended",
                        hadith_by: "Imam Ja’far Ibn Muhammad (a.s.)",
                        arabic: ".سَمِعْتُ جَعْفَرَ بْنَ مُحَمَّدٍ ع يَقُولُ وَ عِنْدَهُ أُنَاسٌ مِنْ أَهْلِ الْكُوفَةِ- عَجَباً لِلنَّاسِ أَنَّهُمْ أَخَذُوا عِلْمَهُمْ كُلَّهُ عَنْ رَسُولِ اللَّهِ ص فَعَمِلُوا بِهِ وَ اهْتَدَوْا وَ يَرَوْنَ أَنَّ أَهْلَ بَيْتِهِ لَمْ يَأْخُذُوا عِلْمَهُ وَ نَحْنُ أَهْلُ بَيْتِهِ وَ ذُرِّيَّتُهُ فِي مَنَازِلِنَا نَزَلَ الْوَحْيُ وَ مِنْ عِنْدِنَا خَرَجَ الْعِلْمُ إِلَيْهِمْ أَ فَيَرَوْنَ أَنَّهُمْ عَلِمُوا وَ اهْتَدَوْا وَ جَهِلْنَا نَحْنُ وَ ضَلَلْنَا إِنَّ هَذَا لَمُحَال",
                        eng: "“I am amazed at the people that they think they have taken all the knowledge from the Messenger of Allah (s.a.w.a.), act upon it and are guided. They also think that we have Ahle Bait (a.s.) have not taken his (s.a.w.a.) knowledge while we are his family members and his progeny. In our houses revelation descended and from us emanated the knowledge to them (i.e. the people). Yet they think they know and they are guided while we are unaware and deviated?!! Surely, this is impossible!!”",
                        urdu: "‘‘مجھے لوگوں پر تعجب ہوتا ہے کہ وہ گمان کرتے ہیں کہ ان لوگوں نے رسول اللہ صلی اللہ علیہ و آلہ و سلم سے تمام علم سیکھ لیا اور اس پر عمل کیا اور ہدایت یافتہ ہوگئے۔ اور وہ یہ بھی گمان کرتے ہیں کہ ہم اہل بیت علیہم السلام نے آپ صلی اللہ علیہ و آلہ و سلم سے علم حاصل نہیں کیا جبکہ ہم ان کے اہل بیت علیہم السلام ہیں اور ان کی ذریت ہیں۔ ہمارے گھروں میں وحی کا نزول ہوا اور ہمارے ذریعہ علم لوگوں تک پہونچا۔ پس کیا وہ لوگ یہ گمان کرتے ہیں کہ وہ جانتے ہیں اور ہدایت یافتہ ہیں اور ہم جاہل ہیں اور گمراہ ہیں۔ یقیناً یہ بات بہت ہی محال ہے۔’’",
                        istranslation: 3,
                        descp: "Narrator says, “I heard (Imam) Ja’far Ibn Muhammad (a.s.) say while there were some people of Kufah (Iraq) with him,",
                        refeng: ["Al-Kaafi, vol. 1, p. 399, H. 3", "Wasaael al-Shiah, vol. 21, p. 477, H. 27632", "Mir’aat al-Oqool, vol. 4, p. 309, H. 3"],
                        refurdu: ["الکافی ج ۱ ص ۳۹۹ ح ۳", "وسائل الشیعہ ج ۲۱ ص ۴۷۷ ح ۲۷۶۳۲", "مرآۃ العقول ج ۴ ص ۳۰۹ ح ۳"],
                        mins: "7"),

                    SizedBox(height: 20,)
                  ],
                ),
                    )
                  ],
                ),
          ),
      );
  }
}