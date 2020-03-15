import 'package:flutter/material.dart';
import 'package:mbttms/screens/home_screen.dart';
import 'package:mbttms/services/db.dart';

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'MBTTMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}