
import 'package:flutter/material.dart';


class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 207, 65, 229),
      title: const Text("Signup",textAlign: TextAlign.center),
      
    ),
    body: LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>720){
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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
            ),
            
          child:
          Container(
            height: 600,
            width: 700,
            child:
            Row(children: [
               Stack(children: [
                Container(
                height: MediaQuery.of(context).size.height,
                width: 700*.5,
                decoration: 
                const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)
                  ),
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
                  width: 350,
                  decoration: 
                const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)
                  ),
                  color: const Color.fromARGB(255, 207, 65, 229),
                )
                )
              ),
              ],
              ),
              Signupscreen(context)
            ]
            )
            

          )
        )
      ],
    )
  );
}

Container Signupscreen(BuildContext context) {
  return Container(
              height:700,
              width:350,
              child: 
              Column(
                children: [
                Container(height:50),
                const Text("Sign Up",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Container(height:50),
                textfields("Firstname"),
                Container(height:20),
                textfields("Lastname"),
                Container(height:20),
                textfields("Email Address"),
                Container(height:20),
                textfields("Username"),
                Container(height:20),
                textfields("Password"),
                Container(height:20),
                textfields("Confirm Password"),
                Container(height:20),
                ElevatedButton(onPressed: (() {
                  Navigator.pushNamed(context, '/home');
                }), 
                child: Text("Login", ),
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 207, 65, 229)),
                 )

              ],
              ),
            );
}

Container textfields(String value1) {
  return Container(
                  width:300,
                  height:40,
                  child: 
                  TextField(
                    maxLines:1,
                    decoration: InputDecoration(
                      hintText: value1,
                      filled: true,
                      fillColor: const Color.fromARGB(255, 189, 188, 188),
                      border: InputBorder.none,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width:1, color: Color.fromARGB(255, 67, 67, 67)),
                        borderRadius: BorderRadius.all(Radius.circular(5)
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width:1, color: Color.fromARGB(255, 67, 67, 67)),
                        borderRadius: BorderRadius.all(Radius.circular(5)
                      )
                      ) 
                    ),
                  ),
                );
}

Widget mobileUI(BuildContext context){
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child:
    
      Card(
        child: Container(
          height:600,
          width:500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(  
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.8,
                  width: 400,
                  decoration: 
                  const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                  height: MediaQuery.of(context).size.height*.8,
                  width: 400,
                  decoration: 
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: const Color.fromARGB(255, 207, 65, 229),
                )
                )
              ),
              Container(
              height:600,
              width:400,
              child: 
              Column(
                children: [
                Container(height:50),
                const Text("Sign Up",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Container(height:50),
                textfields("Firstname"),
                Container(height:20),
                textfields("Lastname"),
                Container(height:20),
                textfields("Email Address"),
                Container(height:20),
                textfields("Username"),
                Container(height:20),
                textfields("Password"),
                Container(height:20),
                textfields("Confirm Password"),
                Container(height:20),
                ElevatedButton(onPressed: (() {
                  Navigator.pushNamed(context, '/home');
                }), 
                child: Text("Login", ),
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229)),
                 )

              ],
              ),
            )
              
              ]),
                  ],
          ),
        )

      )
    
    
  );
  }
}