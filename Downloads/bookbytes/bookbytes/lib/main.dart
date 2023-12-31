import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Ensure this file exists and contains a SplashScreen widget

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookBytes',
      home: Scaffold(
        body: Center(
          child: Builder( // This Builder provides a context below MaterialApp
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'B o o k B y t e s',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'OpenSans',
                    color: Colors.black, // Basic text color
                    letterSpacing: 2.0, // Space between letters
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(9, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50), // Provides some spacing between text and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  child: Text('Explore',
                    style: TextStyle(
                      fontSize: 15, // Adjust the size to your preference
                      fontWeight: FontWeight.w900,
                      fontFamily: 'OpenSans',
                      color: Colors.green.shade400,
                      letterSpacing: 1.5,// Set the color to green
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
