import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mbttms/models/one_way_flights_model.dart';
import 'package:mbttms/widgets/custom_widgets.dart';
import 'package:mbttms/screens/available_flights2.dart';
import 'package:mbttms/screens/flights_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class OneFlightsScreen extends StatefulWidget {
  final OneFlights flights;

  OneFlightsScreen({this.flights});

  @override 
  _FlightsScreenState createState() => _FlightsScreenState();
}

String selectedItem = "";

class _FlightsScreenState extends State<OneFlightsScreen> {
  final formKey = GlobalKey<FormState>();
  String selectedItem1 = "Abidjan", selectedItem11 = "", selectedItem2 = "Abidjan", selectedItem21 = "", selectedItem3 = "AD", selectedItem4 = "ZAR";
  String selectedItem5 = "";
  BasicDateField form = new BasicDateField();
  int index1 = 0, index2 = 0;
 
  List<String> _country = [ "AD","AE","AF","AG","AI","AL","AM","AO","AQ","AR","AS","AT","AU","AW","AZ","BA","BB","BD","BE","BF","BG","BH","BI","BJ","BL","BM","BN",
                            "BO","BQ","BR","BS","BT","BW","BY","BZ","CA","CC","CD","CF","CG","CH","CI","CK","CL","CM","CN","CO","CR","CU","CV","CW","CX","CY","CZ",
                            "DE","DJ","DK","DM","DO","DZ","EC","EE","EG","ER","ES","ET","FI","FJ","FK","FM","FO","FR","GA","GD","GE","GF","GG","GH","GI","GL","GM",
                            "GN","GP","GQ","GR","GS","GT","GU","GW","GY","HK","HN","HR","HT","HU","ID","IE","IL","IN","IQ","IR","IS","IT","JM","JO","JP","KE","KG",
                            "KH","KI","KM","KN","KO","KP","KR","KW","KY","KZ","LA","LB","LC","LI","LK","LR","LS","LT","LU","LV","LY","MA","MC","MD","ME","MG","MH",
                            "MK","ML","MM","MN","MO","MP","MQ","MR","MS","MT","MU","MV","MW","MX","MY","MZ","NA","NC","NE","NG","NI","NL","NO","NP","NR","NU","NZ",
                            "OM","PA","PE","PF","PG","PH","PL","PM","PR","PT","PW","PY","QA","RE","RO","RS","RU","RW","SA","SB","SC","SD","SE","SG","SH","SI","SK",
                            "SL","SN","SO","SR","SS","ST","SV","SX","SY","SZ","TC","TD","TG","TH","TJ","TL","TM","TN","TO","TR","TT","TV","TW","TZ","UA","UG","UK",
                            "US","UY","UZ","VA","VC","VE","VG","VI","VN","VU","WF","WS","YE","YT","ZA","ZM","ZW"];


  List<String> _cities = [ "Abidjan","Abu Dhabi","Abuja","Accra","Addis Ababa","Alexandria","Alexandria (Borg El Arab)","Algiers","Amsterdam","Ankara","Antananarivo",
                          "Atlanta","Athens","Auckland","Baghdad","Bamako","Bangkok","Barcelona","Beijing Capital","Beijing Daxing","Beirut","Belo Horizonte","Bengaluru",
                          "Bogota","Boston","Brasilia","Brazzaville","Brussels International","Brussels S. Charleroi","Bucharest","Buenos Aires","Buenos Aires Jorge Newbery",
                          "Cape Town","Caracas","Cardiff","Casablanca Mohamed V.","Chengdu","Chiang Mai","Chicago","Chicago O'Hare International","Chicago Midway","Conakry",
                          "Dallas","Dar Es Salaam","Dhaka","Douala","Dublin","Durban","Edinburgh","Freetown","Frankfurt","Guangzhou","Guayaquil","Hamburg","Hanoi","Havana",
                          "Harare","Ho Chi Minh","Hong Kong","Hyderabad","Istanbul","Jeddah","Johannesburg","Karachi","Khartoum","Kuala Lumpur International","Kuala Lumpur Sultan Abdul Azziz",
                          "Kuwait","Kinshasa","Kolkata","Lagos","Lima","Lisbon","London","London Heathrow","London Gatwick","Los Angeles","Luanda","Madrid","Manaus","Manila",
                          "Marseille","Medellin Enrique Olaya Herrera","Medellin Jose Maria Cordova","Melbourne","Mexico City","Miami","Milan","Milan Linate","Milan Malpensa",
                          "Mogadishu","Montreal","Moscow Domodedovo","Moscow Sheremetyevo","Moscow Vnukovo","Mumbai","Munich","New Delhi","New York","New York John F. Kennedy",
                          "New York Newark","New York LaGuardia","Nairobi","Nanjing","Osaka","Osaka Kansai","Ottawa","Ouagadougou","Paris","Paris Charles de Gaulle","Paris Orly",
                          "Perth","Philadelphia","Port Au Prince","Port Moresby","Port Of Spain","Port Harcourt","Pyongyang","Quito","Rabat","Recife","Rio De Janeiro",
                          "Rio De Janeiro Internacional","Riyadh","Rome","Rome Ciampino","Rotterdam","San Antonio","San Francisco","San Jose Juan Santamaria","San Jose Tobias Bolanos",
                          "Santiago","Sao Paulo","Sao Paulo Guarulhos","Seoul Gimpo","Seoul Incheon Int'l","Shanghai Hongqiao","Shanghai Pu Dong","Shenzhen","Sydney","Taipei",
                          "Tehran","Tianjin","Tokyo Haneda","Tokyo Narita","Toronto","Tripoli","Turin","Vienna","Warsaw Chopin","Warsaw Modlin","Washington","Wuhan","Windhoek",
                          "Yangon","Yaounde","Zagreb","Zurich"];

  List<String> _cities2 = [ "ABJ-sky","AUH-sky","ABV-sky","ACC-sky","ADD-sky","ALEX-sky","HBE-sky","ALG-sky","AMS-sky","ESB-sky","TNR-sky","ATL-sky","ATH-sky","AKL-sky","BGW-sky",
                          "BKO-sky","BKK-sky","BCN-sky","PEK-sky","PKX-sky","BEY-sky","CNF-sky","BLR-sky","BOG-sky","BOS-sky","BSB-sky","BZV-sky","BRU-sky","CRL-sky",
                          "OTP-sky","BUEA-sky","AEP-sky","CPT-sky","CCS-sky","CWL-sky","CMN-sky","CTU-sky","CNX-sky","CHIA-sky","ORD-sky","MDW-sky","CKY-sky","AFW-sky","DAR-sky",
                          "DAC-sky","DLA-sky","DUB-sky","DUR-sky","EDI-sky","FNA-sky","FRAN-sky","CAN-sky","GYE-sky","HAM-sky","HAN-sky","HAVA-sky","HRE-sky","SGN-sky","HKG-sky",
                          "HYD-sky","ISTA-sky","JED-sky","JNB-sky","KHI-sky","KRT-sky","KUL-sky","SZB-sky","KWI-sky","FIH-sky","CCU-sky","LOS-sky","LIM-sky","LIS-sky","LOND-sky",
                          "LHR-sky","LGW-sky","LAX-sky","LAD-sky","MAD-sky","MAO-sky","MNL-sky","MRS-sky","EOH-sky","MDE-sky","MELA-sky","MEX-sky","MIA-sky","MILA-sky","LIN-sky",
                          "MXP-sky","MGQ-sky","YUL-sky","DME-sky","SVO-sky","VKO-sky","BOM-sky","MUC-sky","DEL-sky","NYCA-sky","JFK-sky","EWR-sky","LGA-sky","NBO-sky","NKG-sky",
                          "OSAA-sky","KIX-sky","YOW-sky","OUA-sky","PARI-sky","CDG-sky","ORY-sky","PER-sky","PHL-sky","PAP-sky","POM-sky","POS-sky","PHC-sky","FNJ-sky","UIO-sky",
                          "RBA-sky","REC-sky","RIOA-sky","GIG-sky","RUH-sky","ROME-sky","CIA-sky","RTM-sky","SAT-sky","SFO-sky","SJO-sky","SYQ-sky","SCL-sky","SAOA-sky","GRU-sky",
                          "GMP-sky","ICN-sky","SHA-sky","PVG-sky","SZX-sky","SYD-sky","TPE-sky","THRA-sky","TSN-sky","HND-sky","NRT-sky","YYZ-sky","TIPA-sky","TRN-sky","VIE-sky",
                          "WAW-sky","WMI-sky","BWI-sky","WUH-sky","WDHA-sky","RGN-sky","NSI-sky","ZAG-sky","ZRH-sky"];

  List<String> _currencies = [ "ZAR","GIP","CUP","RSD","BYN","GEL","GEL","CZK","MNT","MZN","GHS","INR","MWK","DKK","LKR","ALL","NAD","PEN","HUF","SCR","NOK","CHF",
                               "ANG","LBP","MKD","JMD","NZD","FJD","GBP","LRD","PGK","EUR","TRY","PKR","XAF","IQD","CRC","RUB","MUR","SYP","BAM","KZT","BBD","JOD",
                               "CDF","MVR","BTN","MRO","SLL","HKD","VND","UZS","PAB","SHP","XPF","CVE","UAH","TZS","THB","SOS","KGS","BSD","SBD","SAR","ERN","TJS",
                               "LYD","AOA","SDG","BZD","BDT","AED","KHR","MYR","CNY","SGD","NPR","MGA","AWG","LAK","HNL","JPY","KRW","BHD","AZN","CLP","HTG","ARS",
                               "BRL","TTD","ETB","TWD","WST","KPW","ZMW","USD","BOB","DOP","KWD","VUV","HRK","GMD","IRR","PHP","MMK","UGX","AUD","AFN","MAD","RON",
                               "AMD","NGN","EGP","SEK","KMF","GNF","TOP","KYD","MOP","LSL","ISK","NIO","COP","MXN","TMT","DZD","XCD","DJF","IDR","PYG","YER","STD",
                               "BWP","BIF","ILS","SRD","QAR","PLN","UYU","GYD","CAD","TND","BGN","BND","XOF","RWF","KES","SZL","GTQ","BMD","CUC","MDL" ];

  /*List<String> _symbols = [ "R","£","$MN","Дин.","Br","₾","ر.ع.‏","Kč","₮","MT","GH¢","₹","MK","kr.","Rp","Lek","$","S/.","Ft","Rs","kr","CHF","NAf.","ل.ل.‏","ден."
                            "J$","$","$","£","$","K","€","TL","Rs","F","د.ع.‏","₡","₽","Rs","ل.س.‏","КМ","Т","$","د.ا.‏", "FC","MVR","Nu.","UM","Le","HK$","₫","сўм",
                            "B/.","£","F","$","грн.","TSh","฿","S","сом","$","$","SAR","Nfk","TJS","د.ل.‏","Kz","ج.س.‏","BZ$","BDT","AED","KHR","RM","¥","$","रु","Ar",
                            "Afl.","₭","L.","¥","₩","د.ب.‏","₼","$","G","$","R$","TT$","Br","NT$","WS$","₩","ZK","$","Bs","RD$","د.ك.‏","VT","kn","D","ريال","P","K",
                            "USh","$","AFN","د.م.‏","lei","դր.","₦","ج.م.‏","SEK","CF","FG","T$","$","MOP$","M","kr.","C$","$","$","m","د.ج.‏","$","Fdj","Rp","Gs",
                            "ر.ي.‏","Db","P","FBu","₪","$","ر.ق.‏","zł","$U","$","C$","د.ت.‏","лв.","$","F","RWF","S","E","Q","$","CUC","lei" ];*/


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
          color: Colors.redAccent
        ),
      ),  
    );
  }

  OneFlights flight;

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
               'Book a flight', 
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
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding( 
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton( 
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onPressed: () {    
                      Navigator.push( 
                        context,
                        MaterialPageRoute(
                          builder: (_) => FlightsScreen( 
                            flights: flights,
                          ),
                        )      
                      );
                    },
                    child: Text('Return Flights'),
                  ),
                ),
                Padding( 
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.redAccent,
                    textColor: Colors.white, 
                    onPressed: () {    
                      Navigator.push( 
                        context,
                        MaterialPageRoute(
                          builder: (_) => OneFlightsScreen( 
                            flights: flights2,
                          ),
                        )      
                      );
                    },
                    child: Text('One Way Flights'), 
                  ),
                )
              ],
            ),
            SizedBox(height:20.0),
            Padding( 
              padding: EdgeInsets.all(8.0),
              child: Form( 
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[                 
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Departing From',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      value: selectedItem1,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedItem1 = newValue;
                          for( int count = 0; count <= _cities.length; count++ ) {
                          if( newValue == _cities.elementAt(count)) {
                            index1 = count;
                            break;
                          } 
                        }
                        });
                      },
                      items: _cities.map((String value) {
                        return DropdownMenuItem<String>( 
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Flying To',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      value: selectedItem2,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedItem2 = newValue;
                        });
                        for( int count = 0; count < _cities.length; count++ ) {
                            if(newValue == _cities.elementAt(count)) {
                              index2 = count;
                              break;
                            } 
                        }
                      },
                      items: _cities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>( 
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'ISO Country Code',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      value: selectedItem3,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedItem3 = newValue;
                        });
                      },
                      items: _country.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>( 
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Currency Code',
                        border: new OutlineInputBorder( 
                          //borderRadius: new BorderRadius.circular(15.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      value: selectedItem4,
                      onChanged: (String newValue) {
                        setState(() {
                          selectedItem4 = newValue;
                        });
                      },
                      items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>( 
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[ 
                        Padding( 
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton( 
                            child: Text( 'Departure date'),
                            onPressed: () {    
                              showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: new DateTime(2019), 
                                lastDate: new DateTime(2022)
                              ).then((date) {
                                setState(() {
                                  var format = new DateFormat('yyyy-MM-dd');
                                  selectedItem5 = format.format(date);
                                });
                              });
                            },           
                          ),
                        )
                      ],
                    ),  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[ 
                        Padding( 
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton( 
                            onPressed: () {    
                              Navigator.push( 
                                context,
                                MaterialPageRoute(
                                  //builder: (context) => AvailableFlights( flights.country  ) 
                                  builder: (context) => AvailableFlights2( origin: _cities2[index1],
                                                                          destination: _cities2[index2],
                                                                          country: selectedItem3,
                                                                          currency: selectedItem4,
                                                                          departDate: selectedItem5 ), 
                                )
                              );
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

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override 
  Widget build(BuildContext context) {
    return Column(children: <Widget>[ 
      Text('Basic date field (${format.pattern})'),
      DateTimeField( 
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            initialDate: DateTime.now(), 
            firstDate: new DateTime(2019), 
            lastDate: new DateTime(2022) 
          );
        },
      )
    ],);
  }
}







