import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settings_page extends StatefulWidget {
  const settings_page({Key? key}) : super(key: key);

  @override
  State<settings_page> createState() => _settings_pageState();
}

class _settings_pageState extends State<settings_page> {
  bool isarabic = true;
  double _arabic_size = 30;
  double _trans_size = 17;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _arabic_size = _prefs.getDouble('arabic_size')!;
      _trans_size = _prefs.getDouble('trans_size')!;
    });
  }

  void _saveSettings() async {
    await _prefs.setDouble('arabic_size', _arabic_size);
    await _prefs.setDouble('trans_size', _trans_size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Arabic Style & font"),
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_outlined),),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),

              Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align( child: Text("Adjust text size on screen", textAlign: TextAlign.left , style: Theme.of(context).textTheme.titleLarge)),
                    ),
                    SizedBox(height: 30,),
                    Text("Arabic & Urdu", style:  Theme.of(context).textTheme.titleMedium,),
                    Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِِِ", style: TextStyle(fontFamily: 'arabic', fontSize: _arabic_size, height: 2,),),
                    Slider(value: _arabic_size,
                        onChanged: (double value) { setState(() {
                          _arabic_size = value;
                          _saveSettings();
                        });},
                    divisions: 30,
                      min: 25.0,
                      max: 55.0,)
                  ]
                ),
              ),),

              SizedBox(height: 20,),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      children: [
                        Text("Description & Translation", style: Theme.of(context).textTheme.titleMedium,),
                        SizedBox(height: 15,),
                        Text("In the Name of Allah, the Merciful, the Beneficent.", textAlign: TextAlign.center , style: TextStyle( fontSize: _trans_size),),
                        Slider(value: _trans_size,
                          onChanged: (double value) { setState(() {
                            _trans_size = value;
                            _saveSettings();
                          });},
                          divisions: 30,
                          min: 15.0,
                          max: 35.0,)
                      ]
                  ),
                ),),

              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _arabic_size = 30;
                    _trans_size = 17;
                    _saveSettings();
                  });
                },
                child: Text("Reset", style: Theme.of(context).textTheme.titleMedium,), style: ElevatedButton.styleFrom(minimumSize: Size(100, 50), ),),
              SizedBox(height: 20,),
            ],
          ),
      ),
    );
  }
}
