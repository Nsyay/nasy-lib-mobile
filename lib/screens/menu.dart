import 'package:flutter/material.dart';
import 'package:nasy_lib_mobile/widgets/drawerlib.dart';
import 'package:nasy_lib_mobile/widgets/book_card.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final List<BookMenu> items = [
    BookMenu("Lihat Buku", Icons.shelves),
    BookMenu("Tambah Buku", Icons.library_add),
    BookMenu("Logout", Icons.logout),
  ];

  @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Nasy Lib',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.pinkAccent,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top:10, bottom: 10),
                    child: Text(
                      'Nasy Library',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((BookMenu book){
                      return BookCard(book);
                    }).toList(),
                  )
                ]
              ),
            )
          ),
        );
    }
}

