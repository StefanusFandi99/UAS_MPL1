import 'package:flutter/material.dart';

class Pengaturan extends StatefulWidget {
  @override
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  bool tombolMasukan = false;
  bool nyalakanTerusLayar = false;
  bool simpanCatatanPerhitungan = false;
  bool bukaDaftarKalkulator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Umum', style: TextStyle(fontWeight: FontWeight.bold)),
            tileColor: Colors.grey[300],
          ),
          ListTile(
            title: Text('Daftar kalkulator'),
            subtitle: Text('Edit daftar kalkulator favorit'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Kalkulator Mulai'),
            subtitle: Text('Biaya Bahan Bakar'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Tema'),
            subtitle: Text('Default'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Format angka'),
            subtitle: Text('Gunakan bawaan'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Detail', style: TextStyle(fontWeight: FontWeight.bold)),
            tileColor: Colors.grey[300],
          ),
          CheckboxListTile(
            title: Text('Tombol masukan'),
            subtitle: Text('Matikan'),
            value: tombolMasukan,
            onChanged: (bool? value) {
              setState(() {
                tombolMasukan = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Nyalakan terus layar'),
            subtitle: Text('Layar terus menyala'),
            value: nyalakanTerusLayar,
            onChanged: (bool? value) {
              setState(() {
                nyalakanTerusLayar = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Simpan catatan perhitungan'),
            subtitle: Text('Simpan catatan perhitungan terakhir'),
            value: simpanCatatanPerhitungan,
            onChanged: (bool? value) {
              setState(() {
                simpanCatatanPerhitungan = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Buka daftar kalkulator'),
            subtitle: Text('Buka daftar saat memulai'),
            value: bukaDaftarKalkulator,
            onChanged: (bool? value) {
              setState(() {
                bukaDaftarKalkulator = value!;
              });
            },
          ),
          ListTile(
            title: Text('Data Kalkulator', style: TextStyle(fontWeight: FontWeight.bold)),
            tileColor: Colors.grey[300],
          ),
          ListTile(
            title: Text('Backup'),
            subtitle: Text('Backup semua data ke penyimpanan cloud'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
