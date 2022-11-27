import 'package:flutter/material.dart';

class ArithemticScreen extends StatefulWidget {
  const ArithemticScreen({super.key});

  @override
  State<ArithemticScreen> createState() => _ArithemticScreenState();
}

class _ArithemticScreenState extends State<ArithemticScreen> {
  final gap = const SizedBox(
    height: 8,
  );
  final _globalKey=GlobalKey<FormState>();
  final _firstController=TextEditingController();
  final _secondController=TextEditingController();
  int _radioSelected = 1;
  String _radioVal="";
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter first no',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value==null|| value.isEmpty){
                      return 'Fields cannot be empty';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: _secondController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter first no',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value==null|| value.isEmpty){
                      return 'Fields cannot be empty';
                    }
                    return null;
                  },
                ),
                gap,
                RadioListTile(
                  title: Text('Sum'),
                  value: 1,
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value!;
                      _radioVal = 'Sum';
                    });
                  },
                ),
                gap,
                RadioListTile(
                  title: Text('Sub'),
                  value: 2,
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value!;
                      _radioVal = 'Sub';
                    });
                  },
                ),
                gap,
                RadioListTile(
                  title: Text('Multiply'),
                  value: 3,
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value!;
                      _radioVal = 'Multiply';
                    });
                  },
                ),
                gap,
                RadioListTile(
                  title: Text('Divide'),
                  value: 4,
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value!;
                      _radioVal = 'Divide';
                    });
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_globalKey.currentState!.validate()){
                        if(_radioVal=="Sum"){
                          setState(() {
                            result = int.parse(_firstController.text)  + int.parse(_secondController.text);
                          });
                          Navigator.pushNamed(context, '/ans',arguments: result);
                        }
                        else if(_radioVal=="Sub"){
                          setState(() {
                            result = int.parse(_firstController.text)  - int.parse(_secondController.text);
                          });
                          Navigator.pushNamed(context, '/ans',arguments: result);
                        }
                        else if(_radioVal=="Multiply"){
                          setState(() {
                            result = int.parse(_firstController.text)  * int.parse(_secondController.text);
                          });
                          Navigator.pushNamed(context, '/ans',arguments: result);
                        }
                        else if(_radioVal=="Divide"){
                          setState(() {
                            result = int.parse(_firstController.text)  ~/ int.parse(_secondController.text);
                          });
                          Navigator.pushNamed(context, '/ans',arguments: result);
                        }


                      }

                    },
                    child: const Text('Calculate'),
                  ),
                ),
                gap,

              ],
            ),
          ),
        ),
      ),
    );
  }
}