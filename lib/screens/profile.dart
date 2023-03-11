import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fragrance/screens/profile_page/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/welcome_screen.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {

  bool _isArabic = true;
  bool _showTrans = true;
  bool _isNotif =  true;
  bool _isTrans_Eng = true;
  bool _isTrans_Urdu = true;
  String uname = '';
  String? uemail = '';
  String? uphoto = '';
  bool isDataload = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

   _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isArabic = _prefs.getBool('isArabic') ?? true;
      _showTrans = _prefs.getBool('showTrans') ?? true;
      _isNotif = _prefs.getBool('isNotif') ?? true;
      _isTrans_Eng = _prefs.getBool('isTrans_Eng') ?? true;
      _isTrans_Urdu = _prefs.getBool('isTrans_Urdu') ?? true;

      uname = _prefs.getString('name') ?? '';
      uemail = _prefs.getString('email') ?? '';
      uphoto = _prefs.getString('photo') ?? '';
      isDataload = true;
    });
  }

  void _saveSettings() async {
    await _prefs.setBool('isArabic', _isArabic);
    await _prefs.setBool('showTrans', _showTrans);
    await _prefs.setBool('isNotif', _isNotif);
    await _prefs.setBool('isTrans_Eng', _isTrans_Eng);
    await _prefs.setBool('isTrans_Urdu', _isTrans_Urdu);
  }

  @override
  Widget build(BuildContext context) {
    /*
    final String uname = _user.name ?? '';
    final String uemail = _user.email ?? '';
    final String? uphoto = _user?.photo ?? null;*/
    final size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Fragrance of Mastership', style: TextStyle(fontSize: 20),),
            elevation: 1,
            actions: [],
          ),
          body: isDataload ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  SizedBox(height:25,),

                  // user card
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Theme.of(context).disabledColor),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: /*_user == null
                        ? Center(child: CircularProgressIndicator())
                        : */Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container( width: size.width*0.72,
                              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(uname!, style: Theme.of(context).textTheme.titleLarge,),
                                  AutoSizeText(uemail!, style: Theme.of(context).textTheme.titleMedium,),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(width: 47, height: 47,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Theme.of(context).dividerColor,
                                ),
                                child: (uphoto != null ) ? CircleAvatar(
                                  backgroundImage: NetworkImage(uphoto!)) :
                                  Center(child: Text(uname.substring(0,1), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                                ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Divider(),
                        SizedBox(height: 5,),
                        InkWell(
                          child: Row (
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.logout, size: 18, color: Colors.red,),
                              SizedBox(width: 15,),
                              Text("SIGN OUT", style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          onTap: () {
                            showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                              title: const Text("Are you sure you want to sign out?"),
                              actions: [TextButton(onPressed: () {Navigator.pop(context);}, child: const Text("Cancel")),
                                TextButton(onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => welcome_screen()),
                                          (route) => false
                                  );
                                }, child: Text("Sign Out"))],
                            ));
                          },
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 25,),

                  // settings card

                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text('General', style: Theme.of(context).textTheme.titleLarge,),
                      subtitle: Text('Adjust language and display options'),
                      // leading: Icon(Icons.local_pizza),
                      trailing: Icon(Icons.expand_more),
                      children: <Widget>[
                        Column(
                          children: [
                            SwitchListTile(title: Text("Show Arabic"), secondary: Icon(Icons.ac_unit),
                              value: _isArabic,  onChanged: (bool value) {setState(() { if (_showTrans || value) {_isArabic = value;_saveSettings();}
                              else {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("To hide arabic, translations must be enabled."), duration: Duration(seconds: 3),));}
                              if (!_isTrans_Eng && !_isTrans_Urdu) {_isTrans_Eng = true; } // set one translation to true
                              }); },),
                            SizedBox(height: 10,),
                            SwitchListTile(title: Text("Show Translation"), secondary: Icon(Icons.translate),
                              value: _showTrans,
                              onChanged: (bool value) {setState(() { if (_isArabic || value) {_showTrans = value;_saveSettings();}
                              else {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("To hide translations, arabic must be enabled."), duration: Duration(seconds: 3),));} }); },),
                            SizedBox(height: 10,),

                            Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text("Select Translation"),
                                leading: Icon(Icons.abc),
                                trailing: Icon(Icons.expand_more),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    child: Column(children: [
                                      SwitchListTile(title: Text("English"),
                                        value: _isTrans_Eng,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isTrans_Eng = value;
                                            if (_showTrans && !_isTrans_Eng && !_isTrans_Urdu) {
                                              _isTrans_Urdu = true;
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("At least one language must be selected for translation"), duration: Duration(seconds: 3),));
                                            }
                                          });
                                          _saveSettings();
                                        } ),

                                      SizedBox(height: 10,),
                                      SwitchListTile(title: Text("Urdu"),
                                        value: _isTrans_Urdu,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isTrans_Urdu = value;
                                            if (_showTrans && !_isTrans_Eng && !_isTrans_Urdu) {
                                              _isTrans_Eng = true;
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("At least one language must be selected for translation"), duration: Duration(seconds: 3),));
                                            }
                                          });
                                          _saveSettings();
                                        },),
                                    ],),
                                  )

                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            InkWell(
                              child: ListTile(title: Text("Arabic Style & Font"), leading: Icon(Icons.style_outlined),
                                  trailing: Icon(Icons.arrow_forward_ios)),
                              onTap: () {Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => settings_page()));},
                            ),
                            SizedBox(height: 10,),
                            ListTile(title: Text("Theme"), leading: Icon(Icons.light_mode),
                                trailing: Icon(Icons.arrow_forward_ios)),
                            SizedBox(height: 10,),
                            ListTile(title: Text("Change App Language"), leading: Icon(Icons.language_sharp),
                              trailing: Icon(Icons.arrow_forward_ios),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5,),
                  Divider(),
                  SizedBox(height: 5,),

                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('Notifications & Support', style: Theme.of(context).textTheme.titleLarge,),
                      subtitle: Text('Manage notifications and access help'),
                      // leading: Icon(Icons.local_pizza),
                      trailing: Icon(Icons.expand_more),
                      children: <Widget>[
                        Column(
                          children: [
                            SwitchListTile(title: Text("Daily Haidth Notification"), secondary: Icon(Icons.notifications_none),
                              value: _isNotif, onChanged: (bool value) {setState(() { _isNotif = value;}); _saveSettings(); },),
                            SizedBox(height: 10,),
                            ListTile(title: Text("Help"), leading: Icon(Icons.question_answer_outlined),
                              trailing: Icon(Icons.arrow_forward_ios),),
                            SizedBox(height: 10,),
                            ListTile(title: Text("Contact"), leading: Icon(Icons.contact_page),
                                trailing: Icon(Icons.arrow_forward_ios)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5,),
                  Divider(),
                  SizedBox(height: 5,),

                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text('About & Sharing', style: Theme.of(context).textTheme.titleLarge,),
                      subtitle: Text('Learn about the app and share it with others'),
                      // leading: Icon(Icons.local_pizza),
                      trailing: Icon(Icons.expand_more),
                      children: <Widget>[
                        Column(
                          children: [
                            Column(
                              children: [
                                ListTile(title: Text("Share This App"), leading: Icon(Icons.ios_share_rounded),
                                  trailing: Icon(Icons.arrow_forward_ios),),
                                ListTile(title: Text("Report a Bug"), leading: Icon(Icons.report_gmailerrorred),
                                  trailing: Icon(Icons.arrow_forward_ios),),
                                ListTile(title: Text("Credits"), leading: Icon(Icons.link_sharp),
                                  trailing: Icon(Icons.arrow_forward_ios),),
                                ListTile(title: Text("About"), leading: Icon(Icons.help_outline_rounded),
                                  trailing: Icon(Icons.arrow_forward_ios),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5,),
                  Divider(),
                  SizedBox(height: 20,),

                ],
              ),
            ),
          ) : Center(child: Text('')),
    );
  }
}
