
import 'package:flutter/material.dart';
import 'package:practice/screens/about.dart';
import 'package:practice/screens/home.dart';
import 'package:practice/screens/signup.dart';

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
      routes: {
        '/':(context) => MyHomePage(title: "Home"),
        '/signup':(context) => signup(),
        '/home':(context) => home(),
        '/about':(context) => about()
      },
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
    return Scaffold(
      // mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 207, 65, 229),
      title: const Text("Log In",textAlign: TextAlign.center),
      ),
      body: LayoutBuilder(
        builder: (BuildContext , BoxConstraints constraints){
          if(constraints.maxWidth>700){
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
      child: 
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width*.5,
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*.5,
                color: const Color.fromARGB(255, 207, 65, 229),
      
              )
            ),
            ],
          ),
          
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width*.5,
            color: Color.fromARGB(255, 229, 110, 248),
            child:
            loginbuttons(context,0.4, 0.4)
          )
        ]
      )
    );
  
  }

  
  Widget mobileUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
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
        
          loginbuttons(context, 1, 0.8)
        ],
      ),
    );
  }

  Center loginbuttons(BuildContext context, double value1, double value2) {
    return Center(
        child:
        Container(
          width: MediaQuery.of(context).size.width*value2,
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
        
              Textfield1(false,'Username', value1),
              Container(height:30),
              Textfield1(true,'Password', value1),
              Container(height:10),
              Container(
                alignment: Alignment.centerRight,
                child:
                TextButton(onPressed: (() {}), 
                child: 
                const Text("Forget password?",
                style: TextStyle(color: Colors.white), )
                ),
              ),
              Container(height:40),
              Row(
                children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 35,
                    child: 
                    ElevatedButton(onPressed: (() {
                      Navigator.pushNamed(context, "/signup");
                    }), 
                    child: const Text('SIGN UP'),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1, color: Colors.white),
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 145, 17, 209)
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
                    child: const Text('SIGN IN'),
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1, color: Colors.white),
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 238, 60, 10)
                    ),
                    )
                  ),
                ),
                ],
              ),
              
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: const Text('Signin via Social Media',
                style: TextStyle(color: Colors.white),),
              ),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(right: 15.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 36,
                      )),
                ),
                const Icon(Icons.fiber_manual_record, size: 10,color: Colors.white,),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 255, 255, 255),
                        height: 36,
                      )),
                ),
              ]),

              Container(height:30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,  
                children: [
                
                socialmediabuttons("assets/facebook-f.png"),
                Container(width: 15),
                socialmediabuttons("assets/twitter.png"),
                Container(width: 15),
                socialmediabuttons("assets/google.png"),
                 
              
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Image.
                    
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     shape: CircleBorder(), //<-- SEE HERE
                //     padding: EdgeInsets.all(20),
                //   ),
                // ),
              
              ],)

        
              
            ],
            
          ),
        ),
      );
  }

  Container socialmediabuttons(String value1) {
    return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(15),
                      iconSize: 30,
                      icon: Image.asset(value1,color: Colors.white,),
                      onPressed: () {value1=="assets/google.png"?Navigator.pushNamed(context, "/home"):value1;
                      },
                    ),
                  );
  }

  Container Textfield1(bool value1 ,String value2, double wid) {
    return Container(
                width: MediaQuery.of(context).size.width*wid,
                height:50.5,
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
