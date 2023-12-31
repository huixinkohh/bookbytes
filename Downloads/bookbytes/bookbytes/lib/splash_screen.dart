import 'package:flutter/material.dart';
import 'login.dart'; // Make sure you have a LoginScreen widget defined in your project

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
            248, 249, 253, 1.0), // Background color of the app bar
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png', // Replace with your logo asset path
              width: 20, // Adjust the logo width as needed
            ),
            SizedBox(width: 10), // Add some spacing between logo and text
            Text(
              'Bookbytes',
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 15, // Font size
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade50,
              Color.fromRGBO(248, 249, 253, 1.0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Top Spacer
              Spacer(flex: 5),

              // Title
              Text(
                'Buy used: Find cheap second-hand books',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(47, 50, 120, 1.0),
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(height: 20),

              // Subtitle
              Text(
                'We have been selling used books online since 2023.'
                'Discover millions of gently used second-hand books for sale from sellers around the world.'
                'By choosing to shop for used books, you can save money, be sustainable, support independent booksellers, and have access to an unbeatable selection of literature from the past. You can find novels, memoirs and autobiographies, cookery books, poetry, textbooks, and hard-to-find out-of-print editions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(47, 50, 120, 1.0),
                ),
              ),
              SizedBox(height: 32),

              // Login Button
              Container(
                width: 0, // Adjust the width as needed
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, // Button background color
                    primary: Colors.black, // Button text color
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(24), // Apply rounded corners
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Login'),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Image
              SizedBox(
                width: 500, // Adjust the width as needed
                height: 280, // Adjust the height as needed
                child: Image.asset(
                  'assets/images/screen1.webp',
                ),
              ),

              SizedBox(height: 40),

              // Read more text
              Text(
                'Read more throughout your life. Buy and exchange books on Bookbytes', // Added a comma
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 20),

              // Reading description text
              Text(
                'Reading expands your world. Reading is the key to knowledge. ' // Added a period
                'Reading lets you experience hundreds of living lives. Again and again - while you live yours. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(47, 50, 120, 1.0),
                ),
              ),

              // Bottom Spacer
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
