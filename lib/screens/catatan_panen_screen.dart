import 'package:flutter/material.dart';

class CatatanPanenScreen extends StatelessWidget {
  final String lahanNama;

  CatatanPanenScreen({required this.lahanNama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan Panen - $lahanNama", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal Panen', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pilih tanggal',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text('Jumlah Produksi (Ton)', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan jumlah produksi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Simpan Catatan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}