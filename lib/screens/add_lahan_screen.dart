import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TambahLahanScreen extends StatefulWidget {
  const TambahLahanScreen({super.key});

  @override
  State<TambahLahanScreen> createState() => _TambahLahanScreenState();
}

class _TambahLahanScreenState extends State<TambahLahanScreen> {
  File? _image;

  
  String? _selectedPolaTanam;

  // List pilihan pola tanam
  final List<String> _polaTanamOptions = [
    'Baris Bergantian',
    'Lorong',
    'Penyisipan',
    'Pagar Kayu',
    'Seleksi Tanaman Kayu',
  ];

  String? _selectedJenisBibit;
  // List pilihan jenis bibit
  final List<String> _jenisBibitOptions = [
    'Bibit A',
    'Bibit B',
    'Bibit C',
  ];

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Lahan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Kode', 'Masukkan Kode'),
              _buildTextField('Luas Area', 'Masukkan Luas Area'),
              _buildDropdownField('Jenis Bibit', 'Pilih Jenis Bibit',
                  _jenisBibitOptions, _selectedJenisBibit, (value) {
                setState(() {
                  _selectedJenisBibit = value;
                });
              }),
              _buildDropdownField('Pola Tanam', 'Pilih Pola Tanam',
                  _polaTanamOptions, _selectedPolaTanam, (value) {
                setState(() {
                  _selectedPolaTanam = value;
                });
              }),
              _buildTextField('Tahun', 'Masukkan Tahun Tanam Kebun',
                  icon: Icons.calendar_today),
              _buildTextField('Jumlah Produksi', 'Masukkan Jumlah Produksi'),
              _buildDropdownField(
                  'Status Lahan', 'Pilih Status Lahan', [], null, (value) {}),
              const Divider(),
              const Text('Alamat',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              _buildDropdownField(
                  'Provinsi', 'Pilih Provinsi', [], null, (value) {}),
              _buildDropdownField('Kabupaten/Kota', 'Pilih Kabupaten/Kota', [],
                  null, (value) {}),
              _buildDropdownField(
                  'Kecamatan', 'Pilih Kecamatan', [], null, (value) {}),
              _buildDropdownField('Desa/Kelurahan', 'Pilih Desa/Kelurahan', [],
                  null, (value) {}),
              _buildTextField('Alamat', 'Masukkan Alamat'),
              const SizedBox(height: 10),
              _buildImagePicker(),
              const SizedBox(height: 10),
              _buildMapPlaceholder(),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Simpan Data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat input text
  Widget _buildTextField(String label, String hint, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Widget untuk membuat dropdown dengan data
  Widget _buildDropdownField(String label, String hint, List<String> items,
      String? selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text(hint),
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Widget untuk memilih gambar
  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Masukkan Foto Lahan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo, color: Colors.green),
                      Text('Klik untuk mengupload'),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  // Widget untuk placeholder peta
  Widget _buildMapPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pilih Alamat Pada Peta',
            style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text('Map Placeholder'),
          ),
        ),
      ],
    );
  }
}
