import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class AbsensiScreen extends StatefulWidget {
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
        .where((worker) => worker.containsKey('present') && worker['present'] == true)
        .map((worker) => worker.containsKey('name') ? worker['name'].toString() : 'Unknown')
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
        title: 'Absensi Pekerja',
        logoPath: 'assets/logo.png',
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Kehadiran',
              style: TextStyles.headerText,
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: [
                      DataColumn(label: Text('Nama', style: TextStyles.bodyText)),
                      DataColumn(label: Text('Jabatan', style: TextStyles.bodyText)),
                      DataColumn(label: Text('Hadir', style: TextStyles.bodyText)),
                    ],
                    rows: List.generate(workers.length, (index) {
                      return DataRow(cells: [
                        DataCell(Text(workers[index]['name'])),
                        DataCell(Text(workers[index]['role'])),
                        DataCell(
                          Checkbox(
                            value: workers[index]['present'],
                            onChanged: (bool? value) {
                              _togglePresence(index);
                            },
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                      ]);
                    }),
                  ),
                ),
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
