import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final gap = const SizedBox(height: 8);
  final _globalKey = GlobalKey<FormState>();
  final _firstValue = TextEditingController();
  final _secondValue = TextEditingController();
  final _thirdValue = TextEditingController();

  double result=0.0;
  static const a = "principle";
  static const b = "Interest";
  static const c = "Time";
  static const d = "Find Interest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key:_globalKey,
            child: Column(
              children: [
                TextField(
                  controller: _firstValue,
                  decoration: const InputDecoration(
                    labelText: a,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _secondValue,
                  decoration: const InputDecoration(
                    labelText: b,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _thirdValue,
                  decoration: const InputDecoration(
                    labelText: c,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_globalKey.currentState!.validate()){
                        setState(() {
                          result = ((double.parse(_firstValue.text) + double.parse(_secondValue.text) + double.parse(_thirdValue.text)/100));
                        });
                        Navigator.pushNamed(context, '/ans',arguments: result);
                      }
                    },
                    child: const Text(d),
                  ),
                ),
                gap,
                Text("The Interest is $result"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}