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
    _nameController.clear();
    _roleController.clear();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Tambah Petani', style: TextStyles.heading),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama', border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Jabatan', border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal', style: TextStyles.bodyText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () {
                if (_nameController.text.isNotEmpty && _roleController.text.isNotEmpty) {
                  setState(() {
                    petaniList.add({
                      'name': _nameController.text,
                      'role': _roleController.text,
                    });
                  });
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Edit Petani', style: TextStyles.heading),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama', border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Jabatan', border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal', style: TextStyles.bodyText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () {
                if (_nameController.text.isNotEmpty && _roleController.text.isNotEmpty) {
                  setState(() {
                    petaniList[index] = {
                      'name': _nameController.text,
                      'role': _roleController.text,
                    };
                  });
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
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(petaniList[index]['name']!, style: TextStyles.bodyText),
                      subtitle: Text(petaniList[index]['role']!, style: TextStyles.subText),
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
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPetani,
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
