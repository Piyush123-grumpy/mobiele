import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ans extends StatefulWidget {
  const Ans({super.key});
  @override
  State<Ans> createState() => _Ans();
}

class _Ans extends State<Ans> {
  int value=0;
  @override
  Widget build(BuildContext context) {
    value=(ModalRoute.of(context)!.settings.arguments as int?)!;
    return Scaffold(
      body: Center(
        child: Text(
          'Result is :$value',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}