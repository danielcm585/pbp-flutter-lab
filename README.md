# Tugas 7

## Perbedaan stateless widget dan stateful widget

Stateless widget merupakan widget yang tidak dapat mengalami perubahan akibat perubahan nilai dari state yang ada. Stateful widget merupakan widget yang dapat mengalami perubahan berdasarkan nilai dari state yang ada.

## Widget apa saja yang digunakan di proyek ini dan fungsinya

- `Scaffold`: Widget dari layar putih yang menjadi dasar dari widget-widget lain.
- `Center`: Widget yang berfungsi sebagai layout yang mengatur child widget nya ke tengah.
- `Container`: Widget yang berfungsi sebagai layout dari children widget nya.
- `Row` & `Column`: Widget yang berfungsi sebagai layout dari children widget nya dengan arah horizontal untuk Row dan vertikal untuk Column.
- `Text`: Widget yang berfungsi untuk menampilkan tulisan.
- `Visibility`: Widget yang berfungsi untuk mengatur apakah suatu child widget nya ditampilkan atau tidak.
- `FloatingActionButton`: Widget yang berfungsi sebagai fab button yang biasanya melayang pada layar.

## Fungsi dari `setState()` dan variabel yang dapat terdampak oleh fungsi tersebut

Fungsi `setState()` adalah untuk melakukan perubahan nilai dari state yang ada pada sebuat stateful widget. 

## Perbedaan antara `const` dengan `final`

Final variable adalah variable yang tidak dapat diubah setelah di-*assign* suatu nilai. Const variable memiliki beberapa persamaan dengan final variable. Hal utama yang membedakan final dan const variable adalah nilai dari const variable sudah diberikan secara eksplisit saat *compile time*.

## Implementasi Tugas 7

- Membuat fungsi _decrementCounter() untuk mengurangi counter.
- Menambahkan FloatingActionButton pada bottomLeft layar.
- Menambahkan Text yang menampilkan nilai dan paritas dari counter saat ini.
- Menambahkan Visibility pada FloatingActionButton agar dapat disembunyikan pada kondisi tertentu.

# Tugas 8

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`

`Navigator.push` akan menampilkan layar lain di atas layar saat ini, sedangkan `Navigator.pushReplacement` akan menggantikan layar yang sedang ditampilkan dengan layar lain. Artinya, dengan `Navigator.push` kita dapat kembali ke layar sebelumnya, sedangkan pada `Navigator.pushReplacement` tidak.

## Widget digunakan di proyek kali ini dan fungsinya

- `Drawer`: Widget yang digunakan untuk membuat hamburger menu pada sisi kiri appbar yang dapat digunakan untuk navigasi.
- `SizedBox`: Widget yang dapat digunakan sebagai container dari layout lain dengan ukuran tertentu.
- `ListView`: Widget yang dapat digunakan untuk menampilkan children widget dalam sebuah list. Artinya, children widget dapat di-*scroll*.
- `ListTile`: Widget yang merupakan widget yang dapat menampilkan 1-3 baris teks dalam sebuah list.
- `TextFormField`: Widget untuk menerima input teks.
- `DropdownButton`: Widget untuk menampilkan pilihan input.
- `OutlinedButton` & `TextButton`: Widget untuk membuat input berupa tombol.
- `Icon`: Widget untuk menampilkan ikon.
- `Padding` & `EdgeInsets`: Widget untuk mengatur padding dari suatu widget.

## Jenis-jenis event yang ada pada Flutter 

- `onPressed`: Event yang di-*trigger* oleh penekanan suatu widget.
- `onChnaged`: Event yang di-*trigger* oleh perubahan nilai suatu input field.
- `onSaved`: Event yang di-*trigger* ketika sebuah form di-*submit*
 
## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter

Navigator bekerja dengan menyerupai sebuah stack. Artinya, layar dimasukkan di atas dan dikeluarkan juga dari atas. Metode yang umum dilakukan adalah push untuk menampilkan layar baru dan pop untuk kembali ke layar sebelumnya.
 
## Implementasi Tugas 8

- Membuat layar untuk menambahkan data pada `form.dart` dan layar untuk menampilkan data pada `data.dart`.
- Membuat class sebagai tipe dari data yang akan disimpan pada `models/data_model.dart`.
- Membuat array `datas` pada `main.dart` untuk menyimpan data dan fungsi `saveData(newData)` untuk memasukkan data ke array `datas`.
- Membuat drawer pada `drawer.dart` untuk navigasi pada aplikasi.
- Melakukan passing data dan fungsi antar layar.
- Menambahkan input tanggal

# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa, namun implementasi tersebut bukanlah hal yang baik digunakan karena dengan mengimplementasikan model terlebih dahulu sebelum melakukan pengambilan data JSON akan membuat program kita menjadi lebih terstruktur dan rapi.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- `Inkwell`: Widget yang dapat membuat widget child nya bisa di-tekan.
- `Checkbox`: Widget yang dapat menampilkan input berbentuk checkbox.

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

- Widget melakukan request ke API untuk memperoleh data JSON.
- Data JSON yang diperoleh kemudian di-decode kemudian di-convert menjadi bentuk class di Dart.
- Data tersebut kemudian ditampilkan kepada user melalui suatu widget.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

- Membuat page baru `/pages/watchlist.dart` dan `/pages/watchlist_detail.dart`.
- Melakukan request ke Django API dari `/pages/watchlist.dart` yang kemudian ditampilkan menjadi list of `WatchlistItem`.
- Menambahklan navigator pada layar-layar baru tersebut.
- Menambahkan checkbox yang dapat melakukan pemanggilan request secara asynchronous ke Django API.
- Memindahkan fungsi fetch data ke file terpisah.