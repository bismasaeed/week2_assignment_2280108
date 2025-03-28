import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class toDoList {

  final String task ;
  final bool isChecked;

  const toDoList (this.task , this.isChecked);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  final List <toDoList> lists = const [
    toDoList("Wake up early and drink a glass of water 💧", true),
    toDoList("Attend university/classes or study 📖", true),
    toDoList("Go for a short walk or exercise 🚶‍♂️🏃", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Center(
          child: Text(
            'My To-Do List',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      body:  Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Column(
            children: [
              for(int i=0; i<lists.length; i++)
                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text( "${i+1}. " ,style: TextStyle(fontSize: 20), ),
                      Expanded(child: Text( lists[i].task , style: TextStyle(fontSize: 20),)),
                      SizedBox(width: 6,),
                      Text(lists[i].isChecked ? "- Completed ✅" : "- Pending ❌", style: TextStyle(fontSize: 20)),
                      Checkbox(value: lists[i].isChecked , onChanged: null)

                    ],
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
