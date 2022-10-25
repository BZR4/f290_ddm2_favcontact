import 'package:f290_ddm2_favcontacts/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FavContacts',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const HomePage(),
    );
  }
}
