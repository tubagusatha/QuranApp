import 'package:flutter/material.dart';
import 'package:remake_quran_app/pages/detail_screen.dart';
import 'package:remake_quran_app/pages/dzikirpage/pagi.dart';
import 'package:remake_quran_app/pages/dzikirpage/petang.dart';
import 'package:remake_quran_app/pages/home_sceen.dart';
import 'package:remake_quran_app/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        DzikirPagi.routeName: (context) => const DzikirPagi(),
        DzikirPetang.routeName: (context) => const DzikirPetang(),
        HomeScreen.routeName: (context) => const HomeScreen(surahList: []),
        DetailScreen.routeName: (context) => const DetailScreen(id_surah: ''),
      },
    );
  }
}
