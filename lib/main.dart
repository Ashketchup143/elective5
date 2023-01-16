import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'itelective 5',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: 
      // mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: 
            const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/running2.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          Opacity(
            opacity: 0.3,
            child: 
            Container(
              color: const Color.fromARGB(255, 207, 65, 229),

            )
          ),

          Center(
            child:
            Container(
              width: MediaQuery.of(context).size.width*.8,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height:50
                  ),
                  const Icon(
                    Icons.lock_open_outlined,
                    color:Colors.white,
                    size: 90,
                    ),
                  
                  const SizedBox(
                    height:40),
            
                  Textfield1(false,'Username'),
                  Container(height:30),
                  Textfield1(true,'Password'),
                  Container(height:10),
                  Container(
                    alignment: Alignment.centerRight,
                    child:
                    TextButton(onPressed: (() {}), 
                    child: 
                    Text("Forget password?",
                    style: TextStyle(color: Colors.white), )
                    ),
                  ),
                  Container(height:40),
            
                  Row(children: [

                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 35,
                        child: 
                        ElevatedButton(onPressed: (() {
                        }), 
                        child: Text('SIGN UP'),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1, color: Colors.white),
                          shape: StadiumBorder(),
                          backgroundColor: Color.fromARGB(255, 145, 17, 209)
                        ),
                        )
                      ),
                    ),
                    Container(width: 30),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 35,
                        child: 
                        ElevatedButton(onPressed: (() {
                        }), 
                        child: Text('SIGN IN'),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 1, color: Colors.white),
                          shape: StadiumBorder(),
                          backgroundColor: Color.fromARGB(255, 220, 55, 9)
                        ),
                        )
                      ),
                    )
                    ],
                  )
            
                  
                ],
                
              ),
            ),
          )
        ],
      )
    );
  }

  Container Textfield1(bool value1 ,String value2) {
    return Container(
                width: MediaQuery.of(context).size.width,
                height:50,
                child: 
                TextField(
                  obscureText: value1,
                  maxLines:1,
                  decoration: 
                  InputDecoration(
                    labelText: value2,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width:1, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(3)
                      )
                      
                      
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  
                ),
              );
  }
}
