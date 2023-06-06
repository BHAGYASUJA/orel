import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orel/Get/views/imagePicker.dart';

import '../Modals/academicYear.dart';


void main(){
  runApp(MaterialApp(home: ProductCutom(),));
}


class ProductCutom extends StatelessWidget {
  final acedemicYear = TextEditingController();



  @override
  Widget build(BuildContext context) {
   // TextEditingController _controller = TextEditingController();
    final Welcome productList;
   /// ProductCutom(this.productList);
    return Scaffold(
    body:  Form(
         child: Scrollbar(
        child: SingleChildScrollView(
         padding: const EdgeInsets.all(8.0),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              const Text(
                "Academic Year",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 20,
            ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                  DropDownTextField(
                    controller: acedemicYear,
                    dropDownList:
                  // [

                   // DropDownValueModel(

                       // name:'2020-2021', value: "2020"
                   // ),
                    // DropDownValueModel(name: '2015-2016', value: "2020",),
                    // //     toolTipMsg:
                    // //     "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    // DropDownValueModel(name: '2017-2018', value: "2021"),
                    // DropDownValueModel(name: '2019-2020', value: "2021",),
                    // //     toolTipMsg:
                    // //     "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    //  DropDownValueModel(name: '2021-2022', value: "value5"),
                    // DropDownValueModel(name: '2023-2024', value: "value6"),
                    // DropDownValueModel(name: '2024-2025', value: "value7"),
                    // DropDownValueModel(name: '2025-2026', value: "value8"),
                 // ],)
              ),
              SizedBox(height: 10),
              const Text(
                "Student Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Address",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Class/Semseter",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                DropDownTextField(dropDownList:
                const [
                  DropDownValueModel(name: 'Computer Science', value: "2020"),
                  DropDownValueModel(name: 'Science', value: "2020",),
                  //     toolTipMsg:
                  //     "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'Science with maths', value: "2021"),
                  DropDownValueModel(name: 'Humanities', value: "2021",),
                  //     toolTipMsg:
                  //     "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                  DropDownValueModel(name: 'Commerce with Maths', value: "value5"),
                  DropDownValueModel(name: 'Commerce With Statics', value: "value6"),
                ],)
              ),
              SizedBox(height: 10),
              const Text(
                "Whats Number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '',
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Image",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Guardian Name'",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Contact Number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  // controller: name_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
            ])

    )))
    );
  }
}
