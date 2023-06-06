import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Reg(),
  ));
}

class Reg extends StatefulWidget {


  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var value = '-1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Academic Year'),
                        Container(
                          width: 215,
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.keyboard_arrow_down),
                            decoration:
                            InputDecoration(border: OutlineInputBorder()),
                            value: value,
                            items: [
                              DropdownMenuItem(
                                child: Text('--select--'),
                                value: '-1',
                              ),
                              DropdownMenuItem(
                                child: Text('2020-2021'),
                                value: '1',
                              ),
                              DropdownMenuItem(
                                child: Text('2019-2020'),
                                value: '2',
                              ),
                              DropdownMenuItem(
                                child: Text('2018-2019'),
                                value: '3',
                              ),
                            ],
                            onChanged: (v) {},
                          ),
                        ),
                        Text('Student Name'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                        Text('Email'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                        Text('Address'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Class/Semester'),
                        Container(
                          width: 215,
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.keyboard_arrow_down),
                            decoration:
                            InputDecoration(border: OutlineInputBorder()),
                            value: value,
                            items: [
                              DropdownMenuItem(
                                child: Text('--select--'),
                                value: '-1',
                              ),
                              DropdownMenuItem(
                                child: Text('Science'),
                                value: '1',
                              ),
                              DropdownMenuItem(
                                child: Text('Maths'),
                                value: '2',
                              ),
                              DropdownMenuItem(
                                child: Text('English'),
                                value: '3',
                              ),
                            ],
                            onChanged: (v) {},
                          ),
                        ),
                        Text('Whatsapp Number'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                        Text('Image'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                        Text('Guardian Name'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                        Text('Contact Number'),
                        Container(
                            width: 210,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color.fromARGB(255, 233, 164, 187),
                  child: Center(child: Text('Student Login')),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Username'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 150,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Password'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 150,
                            child: TextFormField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Confirm Password'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 150,
                            child: TextFormField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))))),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {},
                  child: Text('Submit'))
            ],
          )),
    );
  }
}