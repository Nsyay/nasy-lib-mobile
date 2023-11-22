import 'package:flutter/material.dart';
import 'package:nasy_lib_mobile/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:nasy_lib_mobile/screens/book_form.dart';
import 'dart:math';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:nasy_lib_mobile/screens/list_product.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: getRandomColor(),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                backgroundColor: Colors.pinkAccent,
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if(item.name == "Tambah Buku"){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BookForm()));
          }
          else if (item.name == "Lihat Buku") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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
