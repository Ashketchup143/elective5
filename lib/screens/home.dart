import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",textAlign: TextAlign.center,),
      ),
      body: LayoutBuilder(
        builder: (BuildContext , BoxConstraints constraints){
          if(constraints.maxWidth>600){
            return webUI(context);
          } else{
            return mobileUI(context);
          }
        },
       )
    );
  }

  Widget webUI(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child:
      Stack(
        children: [
          Row()
        ],
      )
    );
  }

  Widget mobileUI(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
    );
  }
}