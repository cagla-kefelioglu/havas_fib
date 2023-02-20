// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import 'homePage.dart';

void main() => runApp(MyApp());

//providerScope riverpordu kullanabilmek için .
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock
          .navigationKey, //sayfalar arası geçişte Grock kütüphanesi ile geçişi sağlar.
      scaffoldMessengerKey: Grock
          .scaffoldMessengerKey, // feedbacklerde Grock kütüphanesini kullanmamızı sağlar.
      theme: ThemeData(),
      home: Home(),
    );
  }
}
