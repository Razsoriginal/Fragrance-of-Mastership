import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fragrance_of_mastership/controllers/services/settings/provider/settings_provider.dart';
import 'package:fragrance_of_mastership/controllers/services/settings/settings_service.dart';
import 'package:fragrance_of_mastership/controllers/user/provider/user_provider.dart';
import 'package:fragrance_of_mastership/controllers/user/user_service.dart';
import 'package:fragrance_of_mastership/models/appdata/articles/article_model.dart';
import 'package:fragrance_of_mastership/models/appdata/settings/settings_model.dart';
import 'package:fragrance_of_mastership/models/appdata/traditions/note_model.dart';
import 'package:fragrance_of_mastership/models/appdata/user/user-model.dart';
import 'package:fragrance_of_mastership/routes.dart';
import 'package:fragrance_of_mastership/screens/home/home_screen.dart';
import 'package:fragrance_of_mastership/screens/splash/splash_screen.dart';
import 'package:fragrance_of_mastership/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controllers/services/articles/article_service.dart';
import 'controllers/services/articles/provider/articles_provider.dart';
import 'controllers/services/events/provider/events_provider.dart';
import 'controllers/services/insights/insights_service.dart';
import 'controllers/services/insights/provider/insights_provider.dart';
import 'controllers/services/traditions/collections/collections_service.dart';
import 'controllers/services/traditions/collections/provider/collection_provider.dart';
import 'controllers/services/traditions/notes/note_service.dart';
import 'controllers/services/traditions/notes/provider/notes_provider.dart';
import 'controllers/services/traditions/tradition_data_service.dart';
import 'firebase_options.dart';
import 'models/appdata/articles/bookmark_articles_model.dart';
import 'models/appdata/insights/insights_model.dart';
import 'models/appdata/traditions/collection_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(FragranceUserAdapter());
  Hive.registerAdapter(CollectionAdapter());
  Hive.registerAdapter(BookMarkArticleAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SettingsModelAdapter());
  Hive.registerAdapter(InsightsAdapter());

  final noteService = NoteService();
  await noteService.init();

  final collectionService = CollectionService();
  await collectionService.init();

  final articleService = ArticleService();
  await articleService.init();

  final fragranceUserService = FragranceUserService();
  await fragranceUserService.init();

  final settingsService = SettingsService();
  await settingsService.init();

  final insightsService = InsightsService();
  await insightsService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TraditionProvider>(
          create: (_) => TraditionProvider(),
        ),
        ChangeNotifierProvider<NoteProvider>(
          create: (_) => NoteProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<CollectionServiceProvider>(
          create: (_) => CollectionServiceProvider(),
        ),
        ChangeNotifierProvider<ArticleProvider>(
          create: (_) => ArticleProvider(),
        ),
        ChangeNotifierProvider<EventsProvider>(
          create: (_) => EventsProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
        ChangeNotifierProvider<InsightsProvider>(
          create: (_) => InsightsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool loggedIn = FirebaseAuth.instance.currentUser != null;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Fragrance of Mastership',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: loggedIn ? const HomeScreen() : const SplashScreen(),
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
