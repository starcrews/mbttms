import 'package:flutter/material.dart';
import 'package:mbttms/widgets/custom_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:mbttms/models/flights_model.dart';
//import 'package:mbttms/services/db.dart';

class AvailableFlights2 extends StatefulWidget {
  //final Flights departure; //arrival, country, currency;
  //final List<String> flights;
  final String origin, destination, country, currency, departDate;

  //const AvailableFlights({ Key key, this.flights }) : super(key: key);
  AvailableFlights2( { Key key, this.origin, 
                              this.destination,
                              this.country, 
                              this.currency,
                              this.departDate }) : super(key : key);

  @override 
  _AvailableFlightsState2 createState() => _AvailableFlightsState2();
}

class _AvailableFlightsState2 extends State<AvailableFlights2> {
  String url = 'https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browseroutes/v1.0/', url2 = ""; 
  int _currentTab = 0; List data; 
  String country = "", currency = "", origin = "", destination = "", departDate = "", arriveDate = "";
  List route2 = list3();
  
  String sendUrl() {
    country = widget.country.toString();
    currency = widget.currency.toString();
    origin = widget.origin.toString();
    destination = widget.destination.toString();
    departDate = widget.departDate.toString();

    url2 = url + country + '/' + currency + '/en/' + origin + '/' + destination + '/' + departDate;

    return url2;
  }

  AvailableFlights2 flights;

  @override 
  void initState() {
    super.initState();
    this.getJsonData();
    //refresh();
  }

  Future<String> getJsonData() async {
    http.Response response = await http.get(
      Uri.encodeFull(sendUrl()),
      headers: {
        "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
		    "x-rapidapi-key": "a70b3d6729msh20b5d839aa754b9p12233ajsn8845f1de8b00"
      }
    );

    setState(() {
      data = json.decode(response.body)['Carriers'];
    });
    
    return "Successful";
  }

  void _changePage( int value ) {
    Navigator.push( 
      context,
      route2[value],
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text( 
          'Available Flights', 
          style: TextStyle(
            //fontFamily:,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: buildListView(),
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

  Widget buildListView() {
    print(data);
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder:  (context, index) {
        return buildFlightsColumn(data[index]); 
      }
    );
  }

  Widget buildFlightsColumn(dynamic item) => Container( 
    height: 150.0, 
    decoration: BoxDecoration(
      //color: Colors.redAccent
    ),
    //margin: const EdgeInsets.all(8.0),
    child: new Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[ 
        new Container( 
          child: Text(   
            item['Name'],
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.red,
            )
          ),
        ),
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton( 
            onPressed: () { 

            },
            child: Text('Book Flights'),
          )
        )
      ],
    ),
  );
  /*void _save() async { 
    Navigator.of(context).pop();

    Flights flights = new Flights( 
      departureDate: departDate,
      arrivalDate: arriveDate,
      airline: ,
      price: ,
      destination: destination,
      origin: origin,
      time: ,
      currency: currency,
    );

    await DB.insert(Flights.table, flights);
    //setState(() => _task = '');
    refresh();
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.query(Flights.table);
    setState(() {
      
    });
  }*/
}

