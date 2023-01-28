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
        
        child: Center(
          child: Column(
            
          ),
        ),
      ),
    );
  }
}