import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbttms/models/recommendations_model.dart';
import 'package:mbttms/screens/recommendations_screen.dart';
//import 'package:mbttms/widgets/custom_widgets.dart';

class RecommendationsCarousel extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ 
        Padding( 
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[ 
              Text(
                'Top Destinations',
                style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold, 
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      Container( 
        height: 305.0,
        child: ListView.builder( 
          scrollDirection: Axis.horizontal,
          itemCount: recommendations.length,
          itemBuilder: (BuildContext context, int index) {
            Recommendations recommendation = recommendations[index]; 
            return GestureDetector(
              onTap: () => Navigator.push( 
                context, 
                MaterialPageRoute(
                  builder: (_) => RecommendationsScreen( 
                    recommendations: recommendation,
                  ),
                ),
              ),
              child: Container( 
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[ 
                    Positioned(
                      bottom: 15.0,
                      child: Container( 
                      height: 120.0,
                      width: 200.0,
                      decoration: BoxDecoration( 
                        color: Colors.white, 
                      ),
                      child: Padding( 
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[  
                            Text(
                              '${recommendation.activities.length} activities', 
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),  
                            ),
                            Text(
                              recommendation.description, 
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),  
                      ),
                    ),
                    ),
                    Container( 
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: recommendation.imageUrl,
                            child: ClipRRect(
                              child: Image( 
                                height: 180.0, 
                                width: 180.0,
                                image: AssetImage(recommendation.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned( 
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[ 
                                Text(
                                  recommendation.city,
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontSize: 24.0, 
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[ 
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 10.0,
                                      color: Colors.white, 
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      recommendation.country, 
                                      style: TextStyle(
                                        color: Colors.white, 
                                      ),
                                    ),
                                  ]
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
    );
  }
}