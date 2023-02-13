
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _imageUrl;
  var _firstName;
  var _lastName;
  var _email;

  void initState() {
      // TODO: implement initState
      super.initState();
      _fetchUserProfile();
    }
  
  _fetchUserProfile() async {
      final response = await http.get(Uri.parse('https://randomuser.me/api/'));
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        setState(() {
          _imageUrl = userData['results'][0]['picture']['large'];
          _firstName = userData['results'][0]['name']['first'];
          _lastName = userData['results'][0]['name']['last'];
          _email = userData['results'][0]['email'];
        });
      }
      print(_firstName);
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
          height: MediaQuery.of(context).size.height,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height:29
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
                      Navigator.pushReplacementNamed(context, '/signup');
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
              
              ],),

        Center(
        child: _imageUrl == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(_imageUrl),
                  ),
                  SizedBox(height: 20),
                  Text(_firstName),
                  SizedBox(height: 10),
                  Text(_email),
                ],
              ),
      ),
              
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
                      onPressed: () {value1=="assets/google.png"?Navigator.pushReplacementNamed(context, "/home"):value1;
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
