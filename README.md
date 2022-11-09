# pbp-flutter-lab - counter_7
# Tugas 7
# Muhammad Rizqy Ramadhan
# 2106632182
# PBP F

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget merupakan suatu widget yang tidak pernah berubah atau bersifat immutable, termasuk properti dan tampilannya. Statetless widget adalah subclass dari StatelessWidget dan tidak dependen terhadap data yang berubah dan perilaku app. Contoh widget-widget Stateless Widget adalah Icon, IconButton, dan Text.

Di sisi lain, stateful widget adalah widget yang dapat berubah saat aplikasi dijalankan, termasuk properti dan tampilannya. Dalam kata lain, widget ini bersifat dinamis dan mutable. Stateful Widget dapat mengganti tampilannya berkali-kali pada suatu lifetime sebagai respons dari _event_ yang di-_trigger_ oleh interaksi pengguna atau ketika widget tersebut menerima data. Stateful Widget merupakan subclass dari StatefulWidget dengan state dari suatu widget disimpan dalam object State. Ketika set dari suatu widget berubah, object state tersebut memanggil setState(). Contoh widget ini adalah Checkbox, Radio, Slider, Inkwell, Form, dan TextField.


## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- MaterialApp: Widget yang melakukan _wrapping_ pada widget-widget lain untuk keperluan aplikasi Material Design. Widget ini juga mengatur segala jenis route.

- ThemeData: Widget yang berguna untuk mengatur konfigurasi dari tema untuk aplikasi

- MyHomePage: Widget yang berfungsi sebagai halaman utama aplikasi

- AppBar: Widget yang bermanfaat untuk mengatur child widget pada aplikasi. MyAppBar akan membuat widget Container dengan tinggi 56 device-independent pixels dan internal padding 8 pixels. Di dalam Container tersebut, widget menggunakan Row layout. Fungsi AppBar berguna dalam pembuatan title, toolbar, button, dan lain-lain.

-Text: Widget yang berguna sebagai penampilan text pada aplikasi.

-Scaffold: Widget yang berfungsi untuk implementasi basic Material Design visual layout structure.

-Center: Widget yang berfungsi untuk menaruh child di centre (tengah-tengah). 

-Column: Widget flex yang mengatur layout dalam direksi vertikal (Kolom).

-Row: Widget flex yang mengatur layout dalam direksi horizontal (Row).

-FloatingActionButton: Sebuah widget button (tombol) lingkaran yang _hover_ atau "mengambang"



## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Manfaat dari setState() adalah pembangunan ulang (_rebuild_) suatu widget beserta childnya. Variabel yang terpengaruh dari pemanggilan fungsi tersebut bergantung pada pemanggilan dan widget. Sebagai contoh, pada implementasi Tugas 7, fungsi _incrementCounter() memanggil setState(), pemanggilan hal tersebut berdapat pada variabel _counter.


## 4. Jelaskan perbedaan antara const dengan final.
Keyword const bersifat konstan pada compile-time, sehingga variabel akan bersifar frozen dan immutable. Keyword const digunakan ketika variabel diketahui saat compile-time dan tidak pernah berubah.

Keyword final akan set suatu variabel sehingga tidak dapat diubah dan dilakukan operasi yang mengubah nilai/state. Penggunaan keyword final sebaiknya ketika nilainya tidak diketahui saat compile time.


## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

### a. Membuat function untuk melakukan increment dan decrement. Jika nilai counter sudah 0, maka tidak akan di-decrement
increment variabel _counter
```dart
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 0) {
      _counter--;
      }
    });
  }
```

### b. Membuat button untuk increment dan decrement. Kemudian megatur tata letak dan posisi kedua button tersebut dengan floatingActionButtonLocation, Padding, ROW, dan mainAxisAlignment 
```dart
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
```


### c. Membuat function untuk mendapatkan teks "GANJIL" dengan style warna biru dan teks "GENAP" dengan style warna merah sesuai nilai counter ganjil atau genap. 
```dart
  Widget getGanjilGenap() {

    const ganjil = Text('GANJIL', style: TextStyle(color: Colors.blue));
    const genap = Text('GENAP', style: TextStyle(color: Colors.red));

    if (_counter % 2 == 0) {
      return genap;
    } else {
      return ganjil;
    }
  }
```
### d. Menampilkan teks berdasarkan function yang sudah dibuat
```dart
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getGanjilGenap(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
```
