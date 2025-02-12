import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'catatan_panen_screen.dart'; // Halaman catatan panen

class LaporanPanenScreen extends StatelessWidget {
  final List<Map<String, dynamic>> lahanList = [
    {"nama": "Lahan 1", "gambar": "assets/lahan1.jpg"},
    {"nama": "Lahan 2", "gambar": "assets/lahan2.jpg"},
    {"nama": "Lahan 3", "gambar": "assets/lahan3.jpg"},
    {"nama": "Lahan 4", "gambar": "assets/lahan4.jpg"},
  ];

  final List<Map<String, String>> historiPanen = [
    {"tanggal": "21 Jan", "deskripsi": "Panen sawit di Lahan 1"},
    {"tanggal": "29 Jan", "deskripsi": "Panen sawit di Lahan 2"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PILIH LAHAN
            Text('Pilih Lahan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lahanList.length,
                itemBuilder: (context, index) {
                  final lahan = lahanList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CatatanPanenScreen(lahanNama: lahan["nama"])),
                      );
                    },
                    child: Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(lahan["gambar"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                        ),
                        child: Text(lahan["nama"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // STATISTIK PANEN
            Text('Statistik Panen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barGroups: [
                    for (int i = 0; i < 12; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(toY: (i % 4 + 1) * 5, color: Colors.green, width: 16),
                        ],
                      )
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, _) {
                          List<String> bulan = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"];
                          return Text(bulan[value.toInt()], style: TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // HISTORI PANEN
            Text('Histori Panen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: historiPanen.map((panen) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(panen["tanggal"]!, style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    title: Text(panen["deskripsi"]!, style: TextStyle(fontSize: 14)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
