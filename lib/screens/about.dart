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
      drawer: Drawer(
        child:
        Container(
      width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
      height:MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 243, 182, 252),
      child: 
      Column(
        children: [
          Container(height: 50,),
          Sidebuttons(context,'',"Home",0),
          Container(height: 10,),
          Sidebuttons(context,'',"Projects",1),
          Container(height: 10,),
          Sidebuttons(context,'',"Report",2),
          Expanded(child: Container()),
          Sidebuttons(context,'',"Settings",3),
          Container(height: 10,),
          Sidebuttons(context,'',"About Us",4),
          Container(height: 50,),
          ],
      )
      )
      ),
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
  Container Sidebuttons(BuildContext context, String route,text, int number ) {
    var arr = [Icons.home, Icons.business_center, Icons.summarize, Icons.settings, Icons.contact_support];
    return Container(
          width: MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.45:MediaQuery.of(context).size.width*.225,
          height:50,
          child:
          ElevatedButton.icon(onPressed: (() {
                Navigator.pushNamed(context, route);
              }),
              icon:Icon(arr[number]), 
              label: Text(text ),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
               )
          );
  }
}