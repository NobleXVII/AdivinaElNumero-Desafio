import 'package:adivina_el_numero/providers/providers.dart';
import 'package:adivina_el_numero/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalState())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Adivina el numero',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

