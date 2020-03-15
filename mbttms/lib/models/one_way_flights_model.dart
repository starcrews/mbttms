class OneFlights {
  static String table = 'One Way Flights';

  String currency;
  String origin;
  String destination;
  String departureDate;
  String airline;
  String price;
  String time;
  int userId;

  OneFlights({ 
    this.userId,
    this.departureDate,
    this.airline,
    this.price,
    this.destination,
    this.origin,
    this.time,
    this.currency
  });
}