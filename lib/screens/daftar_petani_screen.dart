import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class DaftarPetaniScreen extends StatefulWidget {
  @override
  _DaftarPetaniScreenState createState() => _DaftarPetaniScreenState();
}

class _DaftarPetaniScreenState extends State<DaftarPetaniScreen> {
  List<Map<String, String>> petaniList = [
    {'name': 'Budi Santoso', 'role': 'Petani'},
    {'name': 'Ani Sumarni', 'role': 'Supervisor'},
    {'name': 'Cahyo Nugroho', 'role': 'Pekerja Lapangan'},
    {'name': 'Dewi Lestari', 'role': 'Petani'},
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  void _addPetani() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Petani'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Jabatan'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _roleController.text.isNotEmpty) {
                  setState(() {
                    petaniList.add({
                      'name': _nameController.text,
                      'role': _roleController.text,
                    });
                  });
                  _nameController.clear();
                  _roleController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _editPetani(int index) {
    _nameController.text = petaniList[index]['name']!;
    _roleController.text = petaniList[index]['role']!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Petani'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Jabatan'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _roleController.text.isNotEmpty) {
                  setState(() {
                    petaniList[index] = {
                      'name': _nameController.text,
                      'role': _roleController.text,
                    };
                  });
                  _nameController.clear();
                  _roleController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _deletePetani(int index) {
    setState(() {
      petaniList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Daftar Petani',
        logoPath: 'assets/logo.png',
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: _addPetani,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: petaniList.isEmpty
            ? Center(
                child: Text(
                  'Belum ada petani terdaftar.',
                  style: TextStyles.bodyText,
                ),
              )
            : ListView.separated(
                itemCount: petaniList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(petaniList[index]['name']!, style: TextStyles.bodyText),
                    subtitle: Text(petaniList[index]['role']!, style: TextStyles.bodyText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editPetani(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deletePetani(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
