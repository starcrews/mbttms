import 'package:flutter/material.dart';
import 'package:mbttms/models/profile_models.dart';
import 'package:mbttms/widgets/custom_widgets.dart';

class ProfileScreen extends StatefulWidget {
  final Profiles profiles;

  ProfileScreen({this.profiles});

  @override 
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentTab = 0;

  List icons = list1();
  List routes = list2();
  List route2 = list3();
  
  void _changePage( int value ) {
    Navigator.push( 
      context,
      route2[value],
    );
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
               'Profile', 
                style: TextStyle(
                  //fontFamily:,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: _currentTab,
        backgroundColor: Colors.white70, 
        onTap: (int value) {
          setState(() {
            _currentTab = value;
            _changePage(value);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon( 
              Icons.home,
              size: 30.0,
              color: Colors.red,
            ),
            title: new Text("Home"),
          ),
          BottomNavigationBarItem( 
            icon: Icon( 
              Icons.book,
              size: 30.0,
              color: Colors.red,
            ),
            title: new Text("Trips"),
          ),
          BottomNavigationBarItem( 
            icon: Icon( 
              Icons.person,
              size: 30.0,
              color: Colors.red,
            ),
            title: new Text("Profile"),
          ),
        ],
      ),
    );
  }
}