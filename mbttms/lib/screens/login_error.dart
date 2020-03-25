import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mbttms/screens/home_screen.dart';
import 'package:mbttms/models/login_model.dart';
import 'package:mbttms/widgets/custom_widgets.dart';

class LoginError extends StatefulWidget {
  final String res;

  LoginError({ Key key, this.res }) : super(key : key);

  @override 
  _LoginErrorState createState() => _LoginErrorState();
}

class _LoginErrorState extends State<LoginError> {
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

  Future<String> getUserApi(Map data) async {   
    http.Response response = await http.post( 
      Uri.encodeFull( 'http://192.168.80.1:3000/login' ), 
      headers: {
        "Content-type": "application/json"
      },
      body: jsonEncode(data)
    );
  
    if(response.statusCode != 200 ) {
      throw (response.body ?? "Invalid Login");
    } else {
      print(jsonDecode(response.body)['response']);
      return jsonDecode(response.body)['response']; 
    }
  }

  String res() {
    String response = widget.res.toString();
    String rep = "";
    
    if( response == "WP" ) { 
      rep = "Wrong Password";
    } else if( response == "WU/P" ) {
      rep =  "Wrong Username/Password";
    } else if( response == "Non" ) {
      rep = "The user does not exist";
    }

    return rep;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView( 
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[ 
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 70.0),
              child: Text( 
                '             MBTTMS', 
                style: TextStyle(
                  //fontFamily:,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 80.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 70.0),
              child: Text( 
                res(), 
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.redAccent,
                ),
              ),
            ),
            SizedBox(height: 10.0),
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
                      //onSaved: (input) => _username = input,
                      onChanged: (String newValue) {
                        setState(() {
                          _password = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[ 
                        Padding( 
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton( 
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            onPressed: () {   
                              void status() async {
                                response = await getUserApi(details());
                              }
                              status();

                              if( response == "Yes" ) {
                                Navigator.push( 
                                  context, 
                                  MaterialPageRoute(
                                    builder: (_) => HomeScreen( 
                                      home: home,
                                    ),
                                  )
                                );
                              }
                              else { 
                                Navigator.push( 
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginError( 
                                      res: response,
                                    ),
                                  )
                                );
                              }
                            },
                            child: Text('Login'),
                          ),
                        )
                      ],
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