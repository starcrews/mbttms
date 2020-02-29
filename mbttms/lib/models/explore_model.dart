import 'activity_model.dart';

class Explore {
  String imageUrl;
  String description;

  Explore({ 
    this.imageUrl,
    this.description,
  });
}

List<Explore> explores = [
  Explore( 
    imageUrl: 'images/saopaulo.jpg',
    description: 'Top Destinations',
  ),
  Explore( 
    imageUrl: 'images/hotel1.jpg',
    description: 'Top Hotels',
  ),
  Explore( 
    imageUrl: 'images/murano.jpg',
    description: 'Weekend Getaways',
  ),
  Explore( 
    imageUrl: 'images/paris.jpg',
    description: 'Monthly Deals',
  ),
];