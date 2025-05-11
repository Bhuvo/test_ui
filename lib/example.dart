
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

getData() {
  List<User> l =[
    User('Ahuvi' ,23),
    User('hello' ,20),
    User('he' ,17),

  ];

  var v = l.where((e)=> e.age>18 && e.name[0] == 'A').first;
  for(int i =0 ;i<l.length ;i++){

  }

}


class User {
  final String name;
  final int age;
  User(this.name, this.age);
}

class MTextField extends StatefulWidget {
   MTextField({super.key});

  @override
  State<MTextField> createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextField> {
   StreamController<int> c = StreamController();

  var p = RegExp('');
  int count =0 ;
  ScrollController con =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 100,
          controller: con,
          itemBuilder: (c,_){
        return Text(_.toString());
      }),
      floatingActionButton: IconButton(onPressed: (){
        con.animateTo(con.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        count++;
        c.add(count);
      }, icon: Icon(Icons.add),),
    );
  }
}

