import 'package:cached_firestorage/cached_firestorage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:webdirectories/routes/routerConfig.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDrcaRErNxL1GhUvMj4Cx6f0r9eKDwCgko",
            authDomain: "web-directories.firebaseapp.com",
            projectId: "web-directories",
            storageBucket: "web-directories.appspot.com",
            messagingSenderId: "853657273198",
            appId: "1:853657273198:web:d5ebc0dbaecd2023ff377f"));
  } else {
    await Firebase.initializeApp();
  }
  CachedFirestorage.instance.cacheTimeout = 30;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //Test
  //Test 5

  @override
  Widget build(BuildContext context) {
    GoRouter _router = Routerconfig.returnRouter();
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        routerDelegate: _router.routerDelegate,
        title: 'Web Directories',
      ),
    );
  }
}
