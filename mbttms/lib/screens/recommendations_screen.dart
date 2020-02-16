import 'package:flutter/material.dart';
import 'package:mbttms/models/recommendations_model.dart';
import 'package:mbttms/widgets/recommendations_carousel.dart';
import 'package:mbttms/widgets/custom_widgets.dart';

class RecommendationsScreen extends StatefulWidget {
  final Recommendations recommendations;

  RecommendationsScreen({this.recommendations});

  @override 
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  int _selectedIndex = 0;
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

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () => Navigator.push( 
        context,
        routes[index],
      ), 
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index 
            ? Theme.of(context).accentColor 
            : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: _selectedIndex == index 
            ? Colors.redAccent
            : Color(0xFFB4C1C4),
        ),
      ),  
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
                'Explore the world', 
                style: TextStyle(
                  //fontFamily:,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons
                .asMap()
                .entries
                .map( 
                  (MapEntry map) => _buildIcon(map.key),
                ).toList(),
            ),
            SizedBox(height: 20.0),
            RecommendationsCarousel(),
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