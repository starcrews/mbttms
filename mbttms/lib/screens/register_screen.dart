import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mbttms/screens/home_screen.dart';
import 'package:mbttms/screens/login_screen.dart';
import 'package:mbttms/models/register_model.dart';
import 'package:mbttms/widgets/custom_widgets.dart';

class RegisterScreen extends StatefulWidget {
  final Register register;

  RegisterScreen({this.register});

  @override 
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username, _password;
  final formKey = GlobalKey<FormState>();
  var response;

  Map details() { 
    final Map<String, String> data = {
      "username" : this._username,
      "password" : this._password
    };

    return data;
  } 

  Future<String> registerUser(Map data) async {   
    http.Response response = await http.post( 
      Uri.encodeFull( 'http://192.168.80.1:3000/register' ), 
      headers: {
        "Content-type": "application/json"
      },
      body: jsonEncode(data)
    );
  
    if(response.statusCode != 200 ) {
      throw (response.body ?? "Invalid Login");
    } else {
      return jsonDecode(response.body)['response']; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView( 
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[ 
            Padding(
              padding: EdgeInsets.only(left: 95.0),
              child: Text( 
                'MBTTMS', 
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Padding(
              padding: EdgeInsets.only(left: 135.0),
              child: Text( 
                'Register', 
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding( 
              padding: EdgeInsets.all(8.0),
              child: Form( 
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText: 'Username',
                        border: new OutlineInputBorder( 
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your username" : null,
                      onChanged: (String newValue) {
                        setState(() {
                          _username = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    TextFormField( 
                      obscureText: true,
                      decoration: InputDecoration( 
                        labelText: 'Password',
                        border: new OutlineInputBorder( 
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your password" : null,
                      onChanged: (String newValue) {
                        setState(() {
                          _password = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    Padding( 
                    padding: EdgeInsets.symmetric(horizontal: 1.0),                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[ 
                          GestureDetector( 
                            onTap: () => {
                              Navigator.push( 
                                context, 
                                MaterialPageRoute(
                                  builder: (_) => LoginScreen( 
                                    login: login,
                                  ),
                                )
                              )
                            },
                            child: Text( 
                              'Click here to Login',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          RaisedButton( 
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            onPressed: () {   
                              void status() async {
                                response = await registerUser(details());
                              }
                              status();

                              if( response == "Success" ) {
                                /*Navigator.push( 
                                  context, 
                                  MaterialPageRoute(
                                    builder: (_) => RegisterScreen( 
                                      home: home,
                                    ),
                                  )
                                );*/
                                print(response);
                              }
                              else if( response == "Fail" ) { 
                                print(response);
                              }
                            },
                            child: Text('Register'),
                          ),

                      ],
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}