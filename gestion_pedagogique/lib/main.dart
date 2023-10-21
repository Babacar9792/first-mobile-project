import 'package:flutter/material.dart';
import 'package:gestion_pedagogique/accueil.dart';
import 'package:gestion_pedagogique/login_page.dart';

void main() {
  runApp(MyApp(
    initialRoute: '/',
    routes: {'/acueille': (context) => AccueilPage()},
  ));
}

class DeuxiemeEcran {}

class Accueil {}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required String initialRoute,
      required Map<String, Function(dynamic context)> routes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
