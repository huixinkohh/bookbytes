import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual book list data
    List<String> books = [
      'Book 1',
      'Book 2',
      'Book 3',
      // Add more book titles as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(books[index]),
            // Add any other information about the book, like author, etc.
            onTap: () {
              // Handle tap on a book item, e.g., navigate to book details
              // You can use Navigator to navigate to a new screen or perform
              // any action you need when a book is tapped.
            },
          );
        },
      ),
    );
  }
}
