import 'package:flutter/material.dart';
import 'package:testi/screeens/addition.dart';
import 'package:testi/screeens/ans.dart';
import 'package:testi/screeens/simpleInterest.dart';
import 'package:testi/screeens/game.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Class',
      initialRoute: '/',
      routes:{
        '/':(context) => const game(),
        // '/ans':((context) => const Ans()),
        // '/':((context) => const Interest())
      }
  ));
}
