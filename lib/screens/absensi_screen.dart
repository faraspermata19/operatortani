import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class AbsensiScreen extends StatefulWidget {
  final String lahanNama;
  AbsensiScreen({required this.lahanNama});

  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  List<Map<String, dynamic>> workers = [
    {'name': 'Budi Santoso', 'role': 'Petani', 'present': false},
    {'name': 'Ani Sumarni', 'role': 'Supervisor', 'present': false},
    {'name': 'Cahyo Nugroho', 'role': 'Pekerja Lapangan', 'present': false},
    {'name': 'Dewi Lestari', 'role': 'Petani', 'present': false},
  ];

  void _togglePresence(int index) {
    setState(() {
      workers[index]['present'] = !workers[index]['present'];
    });
  }

  void _saveAttendance() {
    List<String> hadir = workers
        .where((worker) => worker['present'] == true)
        .map((worker) => worker['name'].toString())
        .toList();

    String message = hadir.isNotEmpty
        ? 'Hadir: ${hadir.join(", ")}'
        : 'Tidak ada yang hadir.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Absensi',
        logoPath: 'assets/logo.png',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.lahanNama,
                        style: TextStyles.headerText.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Lokasi: -1.618492, 103.628116',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Tanggal: 21 Januari 2025, 08:01:00',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  Icon(Icons.map, color: Colors.white, size: 40),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Daftar Pekerja', style: TextStyles.headerText),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Nama',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(workers[index]['name'], style: TextStyles.bodyText),
                          Row(
                            children: [
                              Expanded(child: Text('Jam Masuk: 08:00')),
                              Expanded(child: Text('Jam Pulang: 17:00')),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(value: 1, groupValue: 1, onChanged: (val) {}),
                                  Text('Hadir'),
                                  Radio(value: 2, groupValue: 1, onChanged: (val) {}),
                                  Text('Izin'),
                                  Radio(value: 3, groupValue: 1, onChanged: (val) {}),
                                  Text('Telat'),
                                  Radio(value: 4, groupValue: 1, onChanged: (val) {}),
                                  Text('Alpa'),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Pulang'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveAttendance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Simpan Absensi', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
