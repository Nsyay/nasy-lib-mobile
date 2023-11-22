import 'package:flutter/material.dart';
import 'package:nasy_lib_mobile/models/book.dart';

class BookDetail extends StatelessWidget {
  final AsyncSnapshot<List<Book>> snapshot;
  final int selectedIndex;

  BookDetail({
    required this.snapshot,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Access the selected book using the provided index
    final selectedBook = snapshot.data![selectedIndex].fields;

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${selectedBook.name}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Amount: ${selectedBook.amount}'),
            const SizedBox(height: 10),
            Text('Genre: ${selectedBook.genre}'),
            const SizedBox(height: 10),
            Text('Author: ${selectedBook.author}'),
            const SizedBox(height: 10),
            Text('Description: ${selectedBook.description}'),
          ],
        ),
      ),
    );
  }
}
