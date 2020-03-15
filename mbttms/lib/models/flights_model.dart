import 'package:mbttms/models/models.dart';

class Flights {
  static String table = 'flights';

  String currency;
  String origin;
  String destination;
  String arrivalDate;
  String departureDate;
  String airline;
  String price;
  String time;
  int userId;

  Flights({ 
    this.userId,
    this.departureDate,
    this.arrivalDate,
    this.airline,
    this.price,
    this.destination,
    this.origin,
    this.time,
    this.currency
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map  = {
      'departureDate': departureDate,
      'arrivalDate': arrivalDate,
      'airline': airline, 
      'price': price,
      'destination': destination,
      'origin': origin,
      'time': time,
      'currency': currency,
    };

    if(userId != null) { map['id'] = userId; }

    return map;
  }

  static Flights fromMap(Map<String, dynamic> map) {
    return Flights(
      userId: map['id'],
      departureDate: map['departureDate'],
      arrivalDate: map['arrivalDate'],
      airline: map['airline'],
      price: map['price'],
      destination: map['destination'],
      origin: map['origin'],
      time: map['time'],
      currency: map['time']
    );
  }
}
