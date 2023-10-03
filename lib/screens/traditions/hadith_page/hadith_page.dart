import 'package:flutter/material.dart';

import 'components/body.dart';

class HadithPage extends StatelessWidget {
  const HadithPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        index: index,
      ),
    );
  }
}

/*
class HadithPage extends StatefulWidget {
  final String title;
  final int index;

  const HadithPage({
    Key? key,
    required this.title, required this.index,
  }) : super(key: key);

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  late ShareTradition shareTradition;
  final _notesController = TextEditingController();

  late final int traditionId;
  late final String arabicTradition;
  late final String englishQuote;
  late final String urduQuote;
  late final String englishNarratorChain;
  late final String urduNarratorChain;
  late final List<String> englishReference;
  late final List<String> urduReference;

  // late SharedPreferences _prefs;
  late bool _isArabic;
  late bool _showTrans;
  late bool _isTransEng;
  late bool _isTransUrdu;
  late double _arabicSize;
  late double _transSize;



  @override
  void initState() {
    super.initState();
    _pageSettings();
    traditionProvider = Provider.of<TraditionProvider>(context, listen: false);
    _loadTraditionDetails();
    _shareTradition();
  }

  void _shareTradition() {
    shareTradition = ShareTradition(
      title: widget.title,
      arabic: arabicTradition,
      eng: englishQuote,
      urdu: urduQuote,
      descriptionEng: englishNarratorChain,
      descriptionUrdu: urduNarratorChain,
      refEng: englishReference,
      refUrdu: urduReference,
    );
  }

  void _loadTraditionDetails() {
   */
/* final tradition = traditionProvider.getTraditionAtIndex(widget.index);
    shareTradition = ShareTradition(
      title: widget.title,
      arabic: tradition.arabicTradition,
      eng: tradition.englishQuote,
      urdu: tradition.urduQuote,
      descriptionEng: tradition.englishNarratorChain,
      descriptionUrdu: tradition.urduNarratorChain,
      refEng: tradition.englishReference,
      refUrdu: tradition.urduReference,
    );*/ /*

  }


  void _pageSettings() {
    setState(() {
      _isArabic = boxUserSettings.get(0) ?? true;
      _showTrans = boxUserSettings.get(1) ?? true;
      _isTransEng = boxUserSettings.get(2) ?? true;
      _isTransUrdu = boxUserSettings.get(3) ?? true;
      _arabicSize = boxUserSettings.get(4) ?? 35;
      _transSize = boxUserSettings.get(5) ?? 20;

      // _notesController.text = userData.note ?? ''; // fix the notes
    });
  }

  void _saveNotes() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: fHadithPrimaryColor,
            title: const Text(" Notes"),
            content: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                hintText: 'Enter your notes here',
              ),
              onChanged: (value) {},
              controller: _notesController,
            ),
            actions: [
              _notesController.text.isEmpty
                  ? TextButton(
                      child: const Text('Cancel', style: TextStyle(color: fHadithTextColor)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _notesController.text =
                              boxUserData.get('traditionId') ?? '';
                        });
                      },
                    )
                  : TextButton(
                      onPressed: () {
                        _notesController.text = "";
                        */
/*_userDataBox.put(
                        '${title}note', _notesController.text);*/ /*

                      },
                      child: const Text("Clear", style: TextStyle(color: fHadithTextColor))),
              TextButton(
                child: const Text('Save', style: TextStyle(color: fHadithTextColor)),
                onPressed: () {
                  setState(() {
                    */
/*_userDataBox.put(
                        '${title}note', _notesController.text);*/ /*

                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void changeSystemColor(Color color){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  void _showModalBottomSheet() {
    changeSystemColor(fPrimaryLightColor);
    showModalBottomSheet(
        backgroundColor: fHadithPrimaryColor,
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
        ),
        builder: (BuildContext context) {
          // return your layout
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 7,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: fHadithTabColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Hadith References ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: fHadithIconColor,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        englishReference.join('\n\n'),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(13),
                          color: fHadithTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              urduReference.join('\n\n'),
                              style: TextStyle(
                                fontFamily: 'Jameel',
                                fontWeight: FontWeight.w100,
                                fontSize: getProportionateScreenWidth(16),
                                color: fHadithTextColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // const Text(" "),
              ],
            ),
          );
        }).then((value) {
      changeSystemColor(Colors.white);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add_outlined)),
          IconButton(
              onPressed: () {
                _saveNotes();
              },
              icon: const Icon(Icons.note_add_outlined)),
          IconButton(
              onPressed: () {
                _showModalBottomSheet();
              },
              icon: const Icon(Icons.book_outlined)),
          // refrences bottom sheet
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return shareTradition;
                    });
              },
              icon: const Icon(Icons.ios_share_rounded)),
          */
/*PopupMenuButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              itemBuilder: (context) {return [
                PopupMenuItem(child: Row(children: const [Icon(Icons.note_add_outlined, size: 18,) , Text("  Add note", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                PopupMenuItem(child: Row(children: const [Icon(Icons.copy, size: 18,) , Text("  Copy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
                PopupMenuItem(child: Row(children: const [Icon(Icons.share_outlined, size: 18,) , Text("  Share", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)])),
              ];
              }),*/ /*

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),

                    // Hadith Arabic
                    if (_isArabic)
                      Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                arabicTradition,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'noorehuda',
                                  fontSize: _arabicSize,
                                  height: 1.7,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),

                    // Text("Translation",),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_showTrans)
                      Column(
                        children: [
                          if (_isTransEng)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  englishNarratorChain,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                      fontSize: _transSize,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  englishQuote,
                                  style: TextStyle(
                                      fontSize: _transSize,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          if (_isTransUrdu)
                            if (urduNarratorChain.isNotEmpty)
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      urduNarratorChain,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black,
                                          fontFamily: 'Jameel',
                                          fontSize: _transSize,
                                          height: 2),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      urduQuote,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Jameel',
                                          fontSize: _transSize,
                                          fontWeight: FontWeight.w500,
                                          height: 2),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              )
                        ],
                      ),

                    _notesController.text.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _notesController.text,
                                style: TextStyle(fontSize: _transSize),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                          ),

                    //  Divider(),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Divider(),
            ),
            Column(
              children: [
                */
/*RecommendationWidget(
                  traditionNum: traditionId,
                ),*/ /*

              ],
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
*/
