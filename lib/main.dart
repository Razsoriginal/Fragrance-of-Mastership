import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fragrance_of_mastership/controllers/services/quiz/provider/quiz_provider.dart';
import 'package:fragrance_of_mastership/screens/home/home_screen.dart';
import 'package:fragrance_of_mastership/screens/splash/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'controllers/services/articles/article_service.dart';
import 'controllers/services/articles/provider/articles_provider.dart';
import 'controllers/services/events/provider/events_provider.dart';
import 'controllers/services/insights/insights_service.dart';
import 'controllers/services/insights/provider/insights_provider.dart';
import 'controllers/services/settings/provider/settings_provider.dart';
import 'controllers/services/settings/settings_service.dart';
import 'controllers/services/traditions/collections/collections_service.dart';
import 'controllers/services/traditions/collections/provider/collection_provider.dart';
import 'controllers/services/traditions/notes/note_service.dart';
import 'controllers/services/traditions/notes/provider/notes_provider.dart';
import 'controllers/services/traditions/tradition_data_service.dart';
import 'controllers/user/provider/user_provider.dart';
import 'controllers/user/user_service.dart';
import 'firebase_options.dart';
import 'models/appdata/articles/article_model.dart';
import 'models/appdata/articles/bookmark_articles_model.dart';
import 'models/appdata/insights/insights_model.dart';
import 'models/appdata/settings/settings_model.dart';
import 'models/appdata/traditions/collection_model.dart';
import 'models/appdata/traditions/note_model.dart';
import 'models/appdata/user/user-model.dart';
import 'routes.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  Hive
    ..registerAdapter(NoteAdapter())
    ..registerAdapter(FragranceUserAdapter())
    ..registerAdapter(CollectionAdapter())
    ..registerAdapter(BookMarkArticleAdapter())
    ..registerAdapter(ArticleAdapter())
    ..registerAdapter(SettingsModelAdapter())
    ..registerAdapter(InsightModelAdapter());

  final List<dynamic> services = [
    NoteService(),
    CollectionService(),
    ArticleService(),
    FragranceUserService(),
    SettingsService(),
    InsightsService(),
  ];

  await Future.wait(services.map((service) => service.init()));

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
        ChangeNotifierProvider<QuizProvider>(
          create: (_) => QuizProvider(),
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
    final loggedIn = FirebaseAuth.instance.currentUser != null;

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
      routes: routes,
    );
  }
}
