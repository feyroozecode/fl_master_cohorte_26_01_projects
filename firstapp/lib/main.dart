import 'package:firstapp/homepage.dart';
import 'package:flutter/material.dart';

/// Ce fichier et le point d'entrée de l'application.
/// il vas lancer le widget racine MyApp
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CounterApp',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orange)),
      home: const MyHomePage(title: 'Mon beau compteur'),
    );
  }
}
