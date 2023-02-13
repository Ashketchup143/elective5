import 'package:flutter/material.dart';
import 'package:practice/widgets/leftdrawer.dart';
import 'package:practice/widgets/rightdrawer.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>720){
          return webUI(context);
        } else{
          return mobileUI(context);
        }
      },
      );
  }
    Widget mobileUI(BuildContext context) {
      return 
        Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 65, 229),
        title: Text("Home",textAlign: TextAlign.center,),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: Image.network('https://cdn-icons-png.flaticon.com/512/2224/2224321.png')))
        ],
      ),
      endDrawer: rightdrawer(),
      drawer: leftdrawer(),
       body:
      Container(
        color: Color.fromARGB(255, 234, 172, 244),
        child:
        Row(
          children: 
                  [
                    Container(
                      alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: 
                        Container(
                          width: 300,
                          height: 300,
                          child: Image.asset("assets/logo.png"))),
                ],
        )
                ),
        );
      
    
  }
  
  Widget webUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 65, 229),
        title: Text("Home",textAlign: TextAlign.center,),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(), 
              icon: Image.network('https://cdn-icons-png.flaticon.com/512/2224/2224321.png')))
        ],
      ),
      endDrawer: rightdrawer(),
      body:
      Container(
        color: Color.fromARGB(255, 234, 172, 244),
        child:
        Center(
          child: Row(
            children: 
                    [leftdrawer(),
                      Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Container(
                  alignment: Alignment.center,
                    width: 400,
                    height: 400,
                    child: Image.asset("assets/logo.png"))]),
                  ],
          )
                )
                ),
        );

  }
}