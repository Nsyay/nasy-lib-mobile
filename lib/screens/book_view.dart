import 'package:flutter/material.dart';
import 'package:nasy_lib_mobile/screens/book_form.dart';
import 'package:nasy_lib_mobile/widgets/drawerlib.dart';

class BookView extends StatelessWidget {
  final List<Book> books;
  
  BookView({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Koleksi Buku',
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          Book book = books[index];
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Title: ${book.booktitle}',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
                ),
              subtitle: Text('Amount: ${book.amount}\nDescription: ${book.description}'),
            ),
          );
        },
      ),
    );
  }
}