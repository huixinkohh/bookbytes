import 'package:flutter/material.dart';
import 'login.dart'; // Make sure you have a LoginScreen widget defined in your project
import 'package:carousel_slider/carousel_slider.dart';

// Sample seller data (replace with your actual data)
final List<Map<String, dynamic>> sellerData = [
  {
    'name': 'Kelvin Chung',
    'rating': 4.9,
    'books': 'Icebreaker',
    'image': 'https://productimages.worldofbooks.com/1398525685_thumbnail.jpg',
  },
  {
    'name': 'Sarathyvi vishmun',
    'rating': 4.7,
    'books': 'It Ends With Us',
    'image': 'https://productimages.worldofbooks.com/1471156265_thumbnail.jpg'
  },
  {
    'name': 'Abdullab bin Azim',
    'rating': 4.4,
    'books': 'The Bullet That Missed',
    'image': 'https://productimages.worldofbooks.com/0241992389_thumbnail.jpg'
  },
  // Add more seller data as needed
];

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(
            248, 249, 253, 1.0), // Background color of the app bar
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/menu.webp', // Replace with your logo asset path
              width: 30, // Adjust the logo width as needed
            ),
            const SizedBox(width: 10), // Add some spacing between logo and text
            const Text(
              'Bookbytes',
              style: TextStyle(
                color: Colors.black, // Text color
                fontSize: 18, // Font size
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
              const Color.fromRGBO(248, 249, 253, 1.0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SizedBox(
                    height: 40, // Adjust the height to your desired value
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16), // Equal padding on both sides
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search by titles, seller or topics...',
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          // Modify text size here
                          hintStyle: TextStyle(fontSize: 14), // Change the font size to your desired value
                        ),
                        onSubmitted: (String text) {
                          // Implement your search logic here
                          print("Search entered: $text");
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                const Text(
                  'New & Trending',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [
                    'assets/images/book1.jpg', // Replace with your image asset paths
                    'assets/images/book2.jpg',
                    'assets/images/book3.jpg',
                    'assets/images/book4.jpg',
                    'assets/images/book5.jpg',
                  ].map((String imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 280.0, // Set a fixed width for the container
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            // You can add additional styling if needed
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 32),

                const Text(
                  'High Rating Sellers',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 10),
                // Create a ListView.builder for the list of sellers
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: sellerData.length, // Replace with the actual data count
                  itemBuilder: (BuildContext context, int index) {
                    final seller = sellerData[index];
                    return ListTile(
                      title: Text(
                        seller['books'],
                        style: TextStyle(
                          fontSize: 18.0, // Set your desired font size here
                          fontWeight: FontWeight.bold, // You can also customize the font weight
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating: ${seller['rating']}',
                            style: TextStyle(
                              fontSize: 16.0, // Set your desired font size here
                            ),
                          ),
                          Text(
                            'Seller: ${seller['name']}',
                            style: TextStyle(
                              fontSize: 14.0, // Set your desired font size here
                            ),
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          seller['image'] ?? 'https://productimages.worldofbooks.com/0008462461_thumbnail.jpg', // Provide a default value
                          fit: BoxFit.cover,
                        ),
                      ),

                    );
                  },
                ),

                const SizedBox(height: 32),

                // Login Button
                SizedBox(
                  width: 0, // Adjust the width as needed
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Login/Register'),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Read more text



              ],
            ),
          ),
        ),
      ),

    );
  }
}
