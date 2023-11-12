import 'package:flutter/material.dart';
import 'package:nasy_lib_mobile/screens/book_form.dart';
import 'package:nasy_lib_mobile/screens/book_view.dart';
import 'dart:math';

class BookMenu {
  final String name;
  final IconData icon;

  BookMenu(this.name, this.icon);
}

class BookCard extends StatelessWidget {
  final BookMenu item;

  const BookCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getRandomColor(),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                backgroundColor: Colors.pinkAccent,
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if(item.name == "Tambah Buku"){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BookForm()));
          }
          if(item.name == "Lihat Buku"){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => BookView(books : Book.allBooks)));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
