import 'package:flutter/material.dart';
import 'package:practice/widgets/leftdrawer.dart';
import 'package:practice/widgets/rightdrawer.dart';


class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 65, 229),
        title: Text("About",textAlign: TextAlign.center ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: Container(child:Icon(Icons.account_circle_sharp))))
        ],
      ),
      endDrawer: rightdrawer(),
      drawer: leftdrawer(),
      body: Container(
        color:Color.fromARGB(255, 234, 172, 244),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 500,
                alignment: Alignment.topCenter,
                child:Image.asset("assets/UI.jpg"),
              ),
              Container(height:10),
              Container(
                padding: null,
                width: 800,
                child: 
                Text("                  Flutter maybe easy for others but, for me it is pretty hard. One of the hardest things that I had to understand was how the whole built in code of flutter. Firstly, this was my first UI subject that I have taken. Secondly, \n hatdog"))
            ],
            
          ),
        ),
      ),
    );
  }
}