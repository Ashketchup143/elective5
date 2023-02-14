import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class userid extends StatelessWidget {
  String imgURL;
  String first;
  String last ;
  String email ;
  String gender;
  String adress;
  userid({super.key, this.imgURL = "", this.first="", this.last="",this.email="", this.gender="", this.adress=""});

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Center(
        child: 
        Column(
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
                              // image: DecorationImage(
                              //   image: AssetImage('assets/pic2.jpg'),
                              //   fit: BoxFit.fill
                              //   )
                            ),
                            child: imgURL == "" ? Image.network('https://cdn-icons-png.flaticon.com/512/2224/2224321.png') : Image.network(this.imgURL),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 40),
                              child:
                                 Text(first+" "+last,
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
                                children: [
                                  Expanded(child: Container(width:5)),
                                  Icon(
                                    Icons.favorite_border, 
                                    color: Color.fromARGB(255, 162, 157, 157), 
                                    size: 15,),
                                  SizedBox(width:5),
                                  Text(gender,
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
                                  Text(adress,
                                  style: TextStyle(
                                    fontFamily: 'bodoni',
                                    fontSize: 13,
                                    color: Color(0xFF818282)
                                  ),
                                  ),
                                  Expanded(child: Container(width:5)),
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