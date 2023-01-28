import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice/widgets/userid.dart';

class rightdrawer extends StatefulWidget {
  const rightdrawer({super.key});

  @override
  State<rightdrawer> createState() => _rightdrawerState();
}

class _rightdrawerState extends State<rightdrawer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
        height:MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 243, 182, 252),
        child: 
        Column(children: [
          userid(),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(onPressed: (() {
                Navigator.popAndPushNamed(context, "/");
              }), 
              icon: Icon(Icons.logout),
              label: Text("Log Out",),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229), fixedSize: Size(150, 50)),
                ),
            ),
            ),
          
          Expanded(
            flex: 1,
            child:
            Container())
          
          ],
         ),
    );
  }
}