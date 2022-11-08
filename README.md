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

## Implementasi 

- Membuat fungsi _decrementCounter() untuk mengurangi counter.
- Menambahkan FloatingActionButton pada bottomLeft layar.
- Menambahkan Text yang menampilkan nilai dan paritas dari counter saat ini.
- Menambahkan Visibility pada FloatingActionButton agar dapat disembunyikan pada kondisi tertentu.