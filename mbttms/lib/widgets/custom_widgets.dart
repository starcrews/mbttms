import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbttms/screens/cars_screen.dart';
import 'package:mbttms/models/cars_model.dart';
import 'package:mbttms/models/flights_model.dart';
import 'package:mbttms/screens/flights_screen.dart';
import 'package:mbttms/models/hotels_model.dart';
import 'package:mbttms/screens/hotels_screen.dart';
import 'package:mbttms/screens/home_screen.dart';
import 'package:mbttms/models/home_models.dart';
import 'package:mbttms/screens/profile_screens.dart';
import 'package:mbttms/models/profile_models.dart';
import 'package:mbttms/models/recommendations_model.dart';
import 'package:mbttms/screens/recommendations_screen.dart';
import 'package:mbttms/screens/trips_screen.dart';
import 'package:mbttms/models/trips_models.dart';


Flights flights;
Hotels hotels;
Cars cars;
Trips trips;
Homes home;
Profiles profiles;
Recommendations recommendations;

List list1() {
  List<IconData> icons;

  icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.car,
    FontAwesomeIcons.umbrellaBeach,
  ];

  return icons;
}

List list2() {
  List<Route> routes;

  routes = [
      MaterialPageRoute(
        builder: (_) => FlightsScreen( 
          flights: flights,
        ),
      ),
      MaterialPageRoute(
        builder: (_) => HotelsScreen( 
          hotels: hotels,
        ),
      ),
      MaterialPageRoute(
        builder: (_) => CarsScreen( 
          cars: cars,
        ),
      ),
      MaterialPageRoute(
        builder: (_) => RecommendationsScreen( 
          recommendations: recommendations,
        ),
      ),
    ];

  return routes;
} 

List list3() {
  List<Route> routes2; 
  
  routes2 = [
      MaterialPageRoute(
        builder: (_) => HomeScreen( 
          home: home,
        ),
      ),
      MaterialPageRoute(
        builder: (_) => TripsScreen( 
          trips: trips,
        ),
      ),
      MaterialPageRoute(
        builder: (_) => ProfileScreen( 
          profiles: profiles,
        ),
      ),
    ];

  return routes2;
}

/*Widget buildIcon(int index, List icons, List routes, int _selectedIndex, BuildContext context ) {
  Widget _buildIcon;

  _buildIcon = GestureDetector(
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

  return _buildIcon;
}

void _changePage( int value, BuildContext context ) {
    Navigator.push( 
      context,
      route2[value],
    );
  }

BottomNavigationBar _bum(int _currentTab ) {
  BottomNavigationBar bum;

  bum = BottomNavigationBar( 
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
} */

