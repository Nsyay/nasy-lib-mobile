# nasy lib mobile

Nama : Ayu Siti Nasya N
NPM : 2206025426
Kelas : PBP A

## Tugas 9
>> mohon maaf kak, deployment website saya masih ketuker jadi link yang saya pakai link local
1. Ya, bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun hal tersebut jarang dilakukan karena hanya digunakan ketika ingin mengakses data-data sederhana saja. Sebaiknya membuat model terlebih dahulu untuk mengatasi data JSON yang besar dan kompleks. Dengan adanya model, aplikasi akan menjadi lebih efisien dalam penyimpanan dan pengambilan datanya

2. CookieRequest berfungsi untuk mengelola data dan memproses request HTTP. CookieRequest juga dugunakan untuk menyimpan dan mengirim data dari client ke server. CookieRequest harus dibagikan ke semua komponen di aplikasi dengan provider untuk dapat menggunakan package pbp_django_auth.

3. Dalam mekanisme pengambilan data dari JSON hingga dapat ditampilkan di Flutter app ini yaitu, pertama saya membuat model dengan memanfaatkan Quicktype melalui endpoint JSON dari website saya sebelumnya. hasil dari Quicktype tersebut kemudian saya masukkan ke folder models di book.dart. Kemudian melakukan HTTP request dengan package http. Lalu mengizinkan akses dari internet untuk aplikasi ini dengan menambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` di file android/app/src/main/AndroidManifest.xml. Setelah itu data akan ditampilkan di list_product dengan menyesuaikan dengan model book.dart sebelumnya

4. Dalam mekanisme autentikasi input data akun di aplikasi flutter ini yaitu dengan menambahkan django-app authentication pada website saya sebelumnya. Kemudian saya menambahkan corsheader. Selanjutnya saya membuat function login di view. Setelah itu saya beralih ke flutter untuk mengintegrasikannya. Hal pertama yang saya lakukan yaitu menginstall package provider dan pbp_django_auth. Kemudian saya menambahkan CookieRequest untuk semua child widget dengan menggunakan provider untuk dapat menggunakan package tersebut. Lalu saya menambahkan `final request = context.watch<CookieRequest>();` pada login page dart

5. Widget yang saya gunakan pada tugas ini yaitu :
* `InkWell` -> kotak pada setiap button untuk `BookMenu` yang memberikan efek _splash_
* `ScaffoldMessenger` yaitu scaffold yang mengatur tampilan dari `snackbar`
* `SnackBar` _message_ kecil yang tampil seperti notif di bagian bawah aplikasi sebagai umpan balik interaksi dari user
* `Text`  untuk menampilkan teks pada apikasi
* `Column` untuk mengatur layout widget secara vertikal
* `SingleChildScrollView` untuk membuat tampilan aplikasi dapat di scroll sehingga konten tidak harus muat dalam satu layar saja
* `Container` memberikan suatu ruang yang dapat diisikan widget dan dapat dilakukan _positioning_ atau _styling_
* `FutureBuilder` membuat widget sesuai dengan data yang diambil
* `ListView` mengelompokkan objek hingga bisa di scroll

6. Step by step saya mengerjakan tugas ini yaitu pertama saya mengecek website saya apakah sudah terdeploy dengan sempurna atau belum, ternyata website saya yang sudah terdeploy tampaknya masih tertukar dengan website mahasiswa lain. Sehingga saya memutuskan untuk menggunakan link lokal untuk mengerjakan tugas ini. Kemudian saya menambahkan app authentication pada website saya sebelumnya dan menambahkan login logout. Lalu saya integrasikan django dengan flutter melalui website saya sebelumnya. Setelah itu saya membuat login page di flutter dan memastikan bahwa login sudah berfungsi dengan baik. Kemudian saya membuat model untuk Book yang ingin saya tampilkan dengan memanfaatkan JSON dan quicktype, lalu saya tambahkan model tersebut ke dalam aplikasi flutter saya ini. Setelah itu saya melakukan fetch data dari django dan menampilkan dataya di list_product. Dalam list_proudtc tersebut saya menggunakan inkwell untuk tiap item agar dapat diklik dan kemudian mengarahkan ke page detail book. Pada page detail book tersebut saya tampilkan informasi dari tiap buku secara lebih detail seperti author dan genre nya.


## Tugas 8
1. `Navigator.push()` dan `Navigator.pushReplacement()` adalah metode pada flutter untuk menavigasi halaman pada aplikasi. Perbedaannya yaitu :
* `Navigator.push()` digunakan untuk menumpuk halaman baru pada halaman yang sudah ada, sehingga jumlah halaman bertambah. Untuk kembali ke halam sebelumnya dapat memanggil `Navigator.pop()` contoh penggunaan:
```
// Menggunakan Navigator.push() untuk menambahkan halaman baru
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => BookView()),
);
```
* `Navigator.pushReplacement()` digunakan untuk mengganti halaman sekarang dengan halaman baru, sehingga jumlah halaman tidak bertambah. Ketika ditekan tombol kembali pada halaman baru, maka akan beralih ke halaman sebelumnya. Contoh penggunaan:
```
// Menggunakan Navigator.pushReplacement() untuk menggantikan halaman saat ini
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => BookView()),
);
```

2. Layout widget adalah widget yang digunakan untuk mengatur tata letak elemen-elemen pada aplikasi yang sedang kita buat. Beberapa layout widget yang terdapat pada flutter yaitu :
* `Container` -> sebagai wadah untuk satu atau lebih widget
* `Row` -> digunakan untuk mengatur elemen yang berdampingan secara horizontal
* `Column` -> digunakan untuk mengatur elemen yang berdampingan secara vertikal
* `ListView` -> untuk menampilkan daftar widget yang banyak atau ingin melakukan looping suatu list
* `GridView` -> untuk menampilkan daftar widget dalam susunan grid

3. Elemen input yang saya gunakan pada form tambah buku yaitu :
* `TextFormField` -> untuk menampung input yang berupa teks atau string dari pengguna. Saya menggunakan `TextFormField` karena mendukung validasi input untuk memastikan bahwa input sesuai dengan tipe data dan tidak kosong
* `ElevatedButton` -> sebagai tombol untuk menyimpan data yang sudah dimasukkan di form
* `AlertDialog` -> sebagai respons dari interaksi pengguna yaitu dengan menampilkan apa yang baru saja diinput oleh pengguna pada form

4. _Clean architecture_ adalah suatu metode dalam pengembangan aplikasi yang memisahkan program menjadi beberapa bagian dengan batasan yang jelas. Pada flutter, penerapan _Clean architecture_ yaitu dengan mengolah struktur proyek menjadi lebih terorganisir dengan baik. Caranya yaitu dengan memisahkan dan mengelompokkan program dengan suatu batasan tertentu. Seperti misalnya yang saya terapkan pada aplikasi saya ini yaitu memisahkan file dart widget buatan dengan tampilan layar. _Clean architecture_ digunakan agar kode lebih mudah dikembangkan, dirawat, dan diuji.

5. Cara saya mengimplementasikan tugas 8 ini yaitu pertama, saya membuat halaman form beserta semua elemen inputnya (text field dan button) yang akan digunakan pengguna untuk menambah buku sebagai implementasi fitur 'Tambah Buku'. Dalam pembuatan halaman form juga saya menerapkan validasi input untuk memastikan bahwa yang diinput pengguna sesuai dengan tipe data dan tidak kosong. Kemudian saya membuat drawer sebagai navigasi selain navigasi dari home page. Drawer yang saya buat menggunakan `ListTile` dengan routing halaman `Home Page`, `Book Form`, dan `Book View`. Setelah itu saya mengerjakan soal bonus yaitu membuat halaman baru yang menampilkan semua item yang sebelumnya sudah diinput di form. Disini pertama saya membuat Class baru bernama `Book`, sehingga ketika pengguna input form, akan langsung membuat objek `Book` baru. Setelah itu, objek tersebut saya masukkan ke dalam list. pada halaman `Book View` saya looping semua buku yang ada dan menampilkannya dengan menggunakan `ListView.builder`. Terakhir, saya menerapkan _Clean architecture_ pada pengembangan aplikasi saya ini dengan mengelompokkan program yang merupakan halaman atau widget.

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
