import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}
String rngesus(){
  Random random = Random();
  int randomNumber = random.nextInt(10);

  return randomNumber.toString();
}


class _gameState extends State<game> {
  bool _isVisible = false;
  bool _isButtonActive = true;
  var num = 0;
  String num1="1";
  String num2="2";

  int correct=0;
  int incorrect=0;

  String randnum=rngesus();

  showWidget(){
    if(correct > incorrect){
      return const Text("You win",style: TextStyle(color: Colors.green),);
    }
    else if(correct<incorrect){
      return const Text("You Lose",style: TextStyle(color: Colors.red),);
    }
    else{
      return const Text("Draw");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.red[600], // Text Color (Foreground color)
              ),
              onPressed: _isButtonActive
                  ? () {
                      setState(() {
                        num++;

                        if (num >= 10) {
                          _isButtonActive = false;
                          _isVisible=true;
                        }
                        if (int.parse(num1)>=int.parse(randnum)){
                          correct++;
                        }
                        else{
                          incorrect++;
                        }
                        num1=rngesus();
                      });
                    }
                  : null,
              child: Text(num1),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.red[600], // Text Color (Foreground color)
              ),
              onPressed: _isButtonActive
                  ? () {
                      setState(() {
                        num++;
                        num2=rngesus();
                        if (num >= 10) {
                          _isButtonActive = false;
                          _isVisible=true;
                        }
                        if (int.parse(num2)<=int.parse(randnum)){
                          correct++;
                        }
                        else{
                          incorrect++;
                        }
                        num2=rngesus();
                      });
                    }
                  : null,
              child: Text(num2),
            ),
          ),
          Visibility(
            visible:_isVisible,
            child: Container(
              width: 300,
              height: 400,
              color: Colors.red[600],
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Score:$correct",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "Correct:$correct",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child:  Text(
                      "Incorrect:$incorrect",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      num=0;
                      _isButtonActive = true;
                      _isVisible=false;
                      randnum=rngesus();
                      incorrect=0;
                      correct=0;
                    });
                  }, child: const Text("Play Again")),
                  showWidget()




                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
