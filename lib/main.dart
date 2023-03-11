import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fragrance/homepage.dart';
import 'package:fragrance/screens/authentication/welcome_screen.dart';
import 'package:fragrance/screens/home_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(Fragrance());
}

class Fragrance extends StatelessWidget {
  const Fragrance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool loggedIn = FirebaseAuth.instance.currentUser !=null;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      )
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);

    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          ColorScheme lightColorScheme;
          ColorScheme darkColorScheme;
          if (lightDynamic != null && darkDynamic != null) {
            lightColorScheme = lightDynamic.harmonized();
            darkColorScheme = darkDynamic.harmonized();
          } else {
            lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
            darkColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue,);
          }
          return MaterialApp(
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              backgroundColor: darkDynamic?.background ?? Colors.white,
              useMaterial3: true,
              //backgroundColor: darkDynamic?.background ?? Colors.white,
            ),

            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            // home: HomePage(),
            home: loggedIn ? HomePage(): welcome_screen(),
          );
        }
    );
  }
}
