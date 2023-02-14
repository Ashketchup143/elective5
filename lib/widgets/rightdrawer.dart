import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice/widgets/userid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class rightdrawer extends StatefulWidget {
  const rightdrawer({super.key});

  @override
  State<rightdrawer> createState() => _rightdrawerState();
}

class _rightdrawerState extends State<rightdrawer> {
var _imageUrl = "https://cdn-icons-png.flaticon.com/512/2224/2224321.png";
  var _firstName = "";
  var _lastName = "";
  var _email = "";
  var _gender = "";
  var _adress = "";

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
          _gender=userData['results'][0]['gender'];
          _adress=userData['results'][0]['location']['country'];
        });
      }
      print(_gender);
      print(_firstName);
      print(_adress);
    }


  @override
  Widget build(BuildContext context) {
    return  Container(
        width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
        height:MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 243, 182, 252),
        child: 
        Column(children: [
          _imageUrl == "https://cdn-icons-png.flaticon.com/512/2224/2224321.png" ? CircularProgressIndicator(): userid(imgURL: _imageUrl, first:_firstName, last:_lastName,email:_email, gender:_gender, adress:_adress),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(onPressed: (() {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }), 
              icon: Icon(Icons.logout),
              label: Text("Log Out",),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 207, 65, 229), fixedSize: Size(150, 50)),
                ),
            ),
            ),
          
          Expanded(
            flex: 1,
            child:
            Container()),
          
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
    );
  }
}