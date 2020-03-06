import 'package:flutter/material.dart';
import 'package:mbttms/widgets/custom_widgets.dart';
import 'package:mbttms/models/flights_model.dart';

class AvailableFlights extends StatefulWidget {
  final Flights departure; //arrival, country, currency;
  //final List<String> flights;

  //const AvailableFlights({ Key key, this.flights }) : super(key: key);
  AvailableFlights( { Key key, this.departure, 
                              /*this.arrival, 
                              this.country, 
                              this.currency*/ }) : super(key: key);

  @override 
  _AvailableFlightsState createState() => _AvailableFlightsState();
}

class _AvailableFlightsState extends State<AvailableFlights> {
  int _currentTab = 0;

  List route2 = list3();

  void _changePage( int value ) {
    Navigator.push( 
      context,
      route2[value],
    );
  }
  //When you come back set the values of flights variables to selectedItems
  @override
  Widget build(BuildContext context) {
    //print(widget.flights); 
    print(widget.departure);
    //print(widget.arrival);
    //print(widget.country); 
    //print(widget.currency); 

    return Scaffold(
      body: SafeArea(
        child: ListView( 
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[ 
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 70.0),
              child: Text( 
               'Available Flights', 
                style: TextStyle(
                  //fontFamily:,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ]
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

