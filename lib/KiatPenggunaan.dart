import 'package:flutter/material.dart';

class KiatPenggunaan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Kiat Penggunaan', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 57, 57),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Tambahkan logika untuk berbagi
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Tambahkan logika untuk lebih banyak aksi
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tberna.com/img/slot-gacor.png?v=1708014217&width=1100'), // Ganti dengan URL gambar profil yang sesuai
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3.359.657 sedang bermain',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Iklan Taufik Sanusi',
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Text(
              '🔥🔥 Merapat Di ARMADA777 pasti GAK NYESEL Boskuu 🔥',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(height: 8.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk SIGN UP
              },
              child: Text('SIGN UP',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Ketuk dan tahan formulir input angka di mana pun dalam aplikasi dan Anda dapat menggunakan kalkulator.',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Anda dapat menggunakan fungsi tambahan seperti ‘Konverter Mata Uang’ atau ‘Konverter Satuan’ dengan menekan tombol tiga baris di sisi kiri atas.',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Jika Anda menekan dan menahan tombol tanda kurung, Anda dapat menggunakan tanda kurung untuk semua rumus.',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(4.0),
            child: Text(
              'Tekan dan tahan tombol kurangi, Anda dapat mengubah tanda nomor.',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: KiatPenggunaan(),
  ));
}
