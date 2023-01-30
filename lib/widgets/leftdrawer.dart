import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class leftdrawer extends StatefulWidget {
  const leftdrawer({super.key});

  @override
  State<leftdrawer> createState() => _leftdrawerState();
}

class _leftdrawerState extends State<leftdrawer> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
      height:MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 243, 182, 252),
      child: 
      Column(
        children: [
          Container(height: 50,),
          Sidebuttons(context,"Home",0),
          Container(height: 10,),
          Sidebuttons(context,"Projects",1),
          Container(height: 10,),
          Sidebuttons(context,"Report",2),
          Expanded(child: Container()),
          Sidebuttons(context,"Settings",3),
          Container(height: 10,),
          Container(
          width: MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.45:MediaQuery.of(context).size.width*.30,
          height:50,
          child:
          ElevatedButton.icon(onPressed: (() {
                Navigator.pushNamed(context, '/about');
              }),
              icon:Icon(Icons.contact_support), 
              label: Text("About Us"),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
               ),
          ),
          Container(height: 50,),
          ],
      )
        
      );
  }

  Container Sidebuttons(BuildContext context, String text, int number ) {
    var arr = [Icons.home, Icons.business_center, Icons.summarize, Icons.settings, Icons.contact_support];
    return Container(
          width: MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.45:MediaQuery.of(context).size.width*.30,
          height:50,
          child:
          ElevatedButton.icon(onPressed: (() {
              }),
              icon:Icon(arr[number]), 
              label: Text(text ),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
               )
          );
  }
}