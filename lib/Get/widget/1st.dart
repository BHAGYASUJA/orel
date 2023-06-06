import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orel/Get/widget/print.dart';


void main(){
  runApp(MaterialApp(home: mm(),));
}


class mm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
            ElevatedButton(onPressed: (){
            getNumberFact(number: 89);
            }, child: Text("Print"))
        ),
    );
  }
}
