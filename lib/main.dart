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
      title: 'Flutter Demo',
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
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFa1b0fa), Color.fromARGB(255, 170, 127, 238)]
        )
        ),
        child:
        Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
              Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
                child:
                Column(
                  children: [
                    Container(
                      height:437,
                      width: 300,
                      child:
                      Column(
                      children: [
                        Container(
                          height: 210,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0)
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/pic2.jpg'),
                              fit: BoxFit.fill
                              )
                          )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 40),
                            child:
                              const Text("Ashley Lim",
                              style: TextStyle(
                                fontFamily:'bodoni',
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              )
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: 
                            Row(
                              children: const [
                                SizedBox(width:45),
                                Icon(
                                  Icons.favorite_border, 
                                  color: Color.fromARGB(255, 162, 157, 157), 
                                  size: 15,),
                                SizedBox(width:5),
                                Text("Visual Designer",
                                style: TextStyle(
                                  fontFamily: 'bodoni',
                                  fontSize: 13,
                                  color: Color(0xFF818282)
                                ),
                                ),
                                SizedBox(width:5),
                                Icon(
                                  Icons.room_outlined, 
                                  color: Color.fromARGB(255, 162, 157, 157), 
                                  size: 17,
                                  ),
                                SizedBox(width:5),
                                Text("Philppines",
                                style: TextStyle(
                                  fontFamily: 'bodoni',
                                  fontSize: 13,
                                  color: Color(0xFF818282)
                                ),
                                )
                            ],)
                          ),
                        Expanded(
                          child: 
                          Container(
                            padding: const EdgeInsets.only(top:45),
                            child:
                            Row(
                              children: [
                                Expanded(
                                  child:
                                  bottominfo("14k", "Followers"),
                                ),
                                Expanded(
                                  child: 
                                  bottominfo("259", "Following")
                                  ),
                                Expanded(
                                  child:
                                  bottominfo("3k", "Likes") 
                                )
                              ],
                              )
                          )
                          ),
                    ],
                    )
                    )
                  ],
                )
              ),
              Positioned(
                top:190,
                right:0,
                child: 
                MaterialButton(
                  onPressed: () {},
                  elevation:15,
                  color: const Color.fromARGB(255, 237, 217, 33),
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(),
                  child: 
                  const Icon(
                    Icons.add_rounded,
                    size: 30, 
                    color:Color.fromARGB(255, 111, 110, 110)),

                )
                ),
              const Positioned(
                top: 17,
                right: 17,
                child:
                Icon(
                  Icons.male_outlined,
                  color: Colors.white,
                  size: 20,
                )
                )
            ],)
        ],)
      )
        
      )
      
    );
  }

  Container bottominfo(String value1,value2) {
    return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: .5,
                                      color: Colors.grey),
                                    right: BorderSide(
                                      width: .5,
                                      color:Colors.grey
                                    ),
                                  ),   
                                ),
                                child:
                                Column(
                                  children: [
                                  Container(height:15),
                                  Text(value1,style:const TextStyle(fontFamily: 'Noyh',  fontSize: 29, fontWeight:FontWeight.bold, color: Color(0xFF565656))),
                                  Container(height:7),
                                  Text(value2,style:const TextStyle(fontFamily: 'Noyh', fontSize: 13,color: Color.fromARGB(255, 136, 133, 133))),
                                ],)
                              );
  }
}
