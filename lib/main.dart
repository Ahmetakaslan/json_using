import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(),color: Colors.red,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Json using"),
      ),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString("Person/person.json"),
          builder: (context, snapshot) {
            var myData = json.decode(snapshot.data.toString());
            return ListView.builder(
     itemCount: myData.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Text("Name : ${myData[index]['Name']}"),
                          Text("Surname : ${myData[index]['SurName']}"),
                          Text("Age : ${myData[index]['Age']}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
