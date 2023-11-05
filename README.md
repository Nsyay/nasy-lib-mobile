# nasy lib mobile

Nama : Ayu Siti Nasya N
NPM : 2206025426
Kelas : PBP A

## Tugas 7
1. _Stateless Widget_ pada flutter yaitu widget statis yang berarti tidak pernah berubah dan tidak bisa diinteraksi oleh pengguna. Contoh dari _stateless widget_ yaitu `Text`, `Icon`, dan `IconButton`. Sedangkan _Stateful Widget_ pada flutter yaitu widget dinamis yang bisa berubah apabila mendapat perlakuan dari interaksi user atau ketika menerima data. Contoh dari _stateful widget_ yaitu `TextField`, `Checkbox`, `Radio`

2. Widget yang saya gunakan pada tugas ini yaitu :
* `InkWell` -> kotak pada setiap button untuk `BookMenu` yang memberikan efek _splash_
* `ScaffoldMessenger` yaitu scaffold yang mengatur tampilan dari `snackbar`
* `SnackBar` _message_ kecil yang tampil seperti notif di bagian bawah aplikasi sebagai umpan balik interaksi dari user
* `Text`  untuk menampilkan teks pada apikasi
* `Column` untuk mengatur layout widget secara vertikal
* `SingleChildScrollView` untuk membuat tampilan aplikasi dapat di scroll sehingga konten tidak harus muat dalam satu layar saja
* `Container` memberikan suatu ruang yang dapat diisikan widget dan dapat dilakukan _positioning_ atau _styling_

3. Cara saya mengimplementasikan tugas 7 ini yaitu pertama, saya menginisiasi aplikasi baru dengan command `flutter create nasy_lib_mobile`, setelah itu saya membuat file _menu.dart_ di folder lib dengan tujuan yaitu merapikan struktur file dan menerapkan _clean architecture_ dalam pengembangan aplikasi. Kemudian saya mengubah widget dari stateful menjadi stateless. Saya membuat class BookMenu 
```
class BookMenu {
  final String name;
  final IconData icon;

  BookMenu(this.name, this.icon);
}
```
Setelah itu saya membuat stateless widget BookCard untuk menampilkan card dari BookMenu. Di dalam BookCard tersebut juga saya menambahkan SnackBar agar ketika di klik muncul message di bawah aplikasi.
```
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
```
