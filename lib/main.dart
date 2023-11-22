import "package:cpa/UI/screens/splashscreen/mainSplash.dart";
import "package:cpa/api/api_service.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

import "UI/screens/Analysis/analysis_final.dart";
import "UI/screens/Analysis/analysis_page1.dart";
import "UI/screens/homescreen/homescreen.dart";
import "UI/screens/homescreen/products/products_screen.dart";
import "UI/screens/login.dart";
import "UI/screens/splashscreen/splash_screen.dart";
import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
