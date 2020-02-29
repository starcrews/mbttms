import 'package:flutter/material.dart';
import 'package:mbttms/models/explore_model.dart';

class ExploreCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( 
      children: <Widget>[ 
        Container(
          height: 235, 
          child: ListView.builder( 
            scrollDirection: Axis.horizontal,
            itemCount: explores.length,
            itemBuilder: (BuildContext context, int index) {
              Explore explore = explores[index]; 
              return Container( 
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[ 
                    Positioned( 
                      bottom: 15.0,
                      child: Padding( 
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[ 
                            Text( 
                              explore.description,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        )
                      )
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: Image(
                              height: 180.0, 
                              width: 180.0,
                              image: AssetImage(explore.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          )
        ),
      ], 
    );
  }
}