# Counter 7

## Perbedaan stateless widget dan stateful widget

Stateless widget merupakan widget yang tidak dapat mengalami perubahan akibat perubahan nilai dari state yang ada. Stateful widget merupakan widget yang dapat mengalami perubahan berdasarkan nilai dari state yang ada.

## Widget apa saja yang digunakan di proyek ini dan fungsinya

- Scaffold

  Scaffold adalah widget dari layar putih yang menjadi dasar dari widget-widget lain.

- Center 

  Center merupakan widget yang berfungsi sebagai layout yang mengatur child widget nya ke tengah.

- Container

  Container merupakan widget yang berfungsi sebagai layout dari children widget nya.

- Row & Column

  Row & Column merupakan widget yang berfungsi sebagai layout dari children widget nya dengan arah horizontal untuk Row dan vertikal untuk Column.

- Text

  Text merupakan widget yang berfungsi untuk menampilkan tulisan.

- Visibility

  Visibility merupakan widget yang berfungsi untuk mengatur apakah suatu child widget nya ditampilkan atau tidak.

- FloatingActionButton

  FloatingActionButton merupakan widget yang berfungsi sebagai fab button yang biasanya melayang pada layar.

## Fungsi dari setState() dan variabel yang dapat terdampak oleh fungsi tersebut

Fungsi setState() adalah untuk melakukan perubahan nilai dari state yang ada pada sebuat stateful widget. 

## Perbedaan antara const dengan final

Final variable adalah variable yang tidak dapat diubah setelah di-*assign* suatu nilai. Const variable memiliki beberapa persamaan dengan final variable. Hal utama yang membedakan final dan const variable adalah nilai dari const variable sudah diberikan secara eksplisit saat *compile time*.

## Implementasi Tugas 7

- Membuat fungsi _decrementCounter() untuk mengurangi counter.
- Menambahkan FloatingActionButton pada bottomLeft layar.
- Menambahkan Text yang menampilkan nilai dan paritas dari counter saat ini.
- Menambahkan Visibility pada FloatingActionButton agar dapat disembunyikan pada kondisi tertentu.

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`

`Navigator.push` akan menampilkan layar lain di atas layar saat ini, sedangkan `Navigator.pushReplacement` akan menggantikan layar yang sedang ditampilkan dengan layar lain. Artinya, dengan `Navigator.push` kita dapat kembali ke layar sebelumnya, sedangkan pada `Navigator.pushReplacement` tidak.

## Widget digunakan di proyek kali ini dan fungsinya

- Drawer 

Widget ini digunakan untuk membuat hamburger menu pada sisi kiri appbar yang dapat digunakan untuk navigasi.

- SizedBox

Widget ini dapat digunakan sebagai container dari layout lain dengan ukuran tertentu.

- ListView

Widget ini dapat digunakan untuk menampilkan children widget dalam sebuah list. Artinya, children widget dapat di-*scroll*.

- ListTile

Widget ini merupakan widget yang dapat menampilkan 1-3 baris teks dalam sebuah list.

- TextFormField 

Widget untuk menerima input teks.

- DropdownButton

Widget untuk menampilkan pilihan input.

- OutlinedButton, TextButton

Widget untuk membuat input berupa tombol.

- Icon

Widget untuk menampilkan ikon.

- Padding, EdgeInsets

Widget untuk mengatur padding dari suatu widget.

## Jenis-jenis event yang ada pada Flutter 

- hmm
 
## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter

Navigator bekerja dengan menyerupai sebuah stack. Artinya, layar dimasukkan di atas dan dikeluarkan juga dari atas. Metode yang umum dilakukan adalah push untuk menampilkan layar baru dan pop untuk kembali ke layar sebelumnya.
 
## Implementasi Tugas 8

- Membuat layar untuk menambahkan data pada `form.dart` dan layar untuk menampilkan data pada `data.dart`.
- Membuat class sebagai tipe dari data yang akan disimpan pada `models/data_model.dart`.
- Membuat array `datas` pada `main.dart` untuk menyimpan data dan fungsi `saveData(newData)` untuk memasukkan data ke array `datas`.
- Membuat drawer pada `drawer.dart` untuk navigasi pada aplikasi.
- Melakukan passing data dan fungsi antar layar.
- Menambahkan input tanggal