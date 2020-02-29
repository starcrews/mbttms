import 'package:flutter/material.dart';
import 'package:mbttms/models/hotels_model.dart';
import 'package:mbttms/widgets/custom_widgets.dart';

class HotelsScreen extends StatefulWidget {
  final Hotel hotels;

  HotelsScreen({this.hotels});

  @override 
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  int _selectedIndex = 1;
  int _currentTab = 0;
  String destination = "", arrival = "", departure = "", rooms = "", guests = "";
  final formKey = GlobalKey<FormState>();

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
                'Book a hotel', 
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
                        labelText: 'Destination',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your takeoff destination" : null,
                      onSaved: (input) => destination = input,
                    ),
                    SizedBox(height: 15.0),
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText: 'Arrival Date',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your arrival destination" : null,
                      onSaved: (input) => arrival = input,
                    ),
                    SizedBox(height: 15.0),
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText: 'Departure Date',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your departure date" : null,
                      onSaved: (input) => departure = input,
                    ),
                    SizedBox(height: 15.0),
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText: 'No. of Rooms',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your arrival date" : null,
                      onSaved: (input) => rooms = input,
                    ),
                    SizedBox(height: 15.0),
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText: 'No. of Guests',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (input) => input.contains( "" ) ? "Please enter your arrival date" : null,
                      onSaved: (input) => guests = input,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[ 
                        Padding( 
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton( 
                            onPressed: () {    
                              /*Navigator.push( 
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AvailableFlights( flights: data ) 
                                ),
                              );*/
                            },
                            child: Text('Search'),
                          ),
                        )
                      ],
                    )
                  ],
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