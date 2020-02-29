import 'package:flutter/material.dart';
import 'package:mbttms/models/home_models.dart';
import 'package:mbttms/widgets/custom_widgets.dart';
import 'package:mbttms/widgets/explore_carousel.dart';

class HomeScreen extends StatefulWidget {
  final Homes home;

  HomeScreen({this.home});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _selectedIndex = 0;   
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
      onTap: () => Navigator.pushReplacement( 
        context,
        routes[index],
      ), 
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: Colors.redAccent
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
                'Plan your trip', 
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
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 26.0, right: 22.0),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: list4(),
              ),
            ),
            SizedBox(height: 40.0),
            Padding( 
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text ( 
                    'Travel Smarter', 
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),     
            SizedBox(height: 20.0),       
            Container( 
              height: 200.0,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: 
                Text(
                  '    Book Flights\n             Book Hotels\n                        Hire Cars\n\n    All at the best prices!',
                  style: TextStyle(  
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                ),
              decoration: new BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 20.0),
            Padding( 
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text ( 
                    'Explore the World', 
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector( 
                    onTap: () => print('See All'),
                    child: Text( 
                      'See All',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ExploreCarousel(),
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