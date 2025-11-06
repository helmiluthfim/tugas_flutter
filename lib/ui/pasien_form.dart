import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  final Pasien? pasien;

  const PasienForm({super.key, this.pasien});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmController = TextEditingController();
  final _namaController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _telpController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pasien != null) {
      _noRmController.text = widget.pasien!.nomorRm;
      _namaController.text = widget.pasien!.nama;
      _tglLahirController.text = widget.pasien!.tanggalLahir;
      _telpController.text = widget.pasien!.nomorTelepon;
      _alamatController.text = widget.pasien!.alamat;
    }
  }

  @override
  void dispose() {
    _noRmController.dispose();
    _namaController.dispose();
    _tglLahirController.dispose();
    _telpController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.blueAccent),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.pasien == null ? 'Tambah Pasien' : 'Ubah Data Pasien',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: _noRmController,
                decoration: _inputDecoration('Nomor RM'),
                validator: (value) =>
                    value!.isEmpty ? 'Nomor RM wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _namaController,
                decoration: _inputDecoration('Nama Pasien'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tglLahirController,
                decoration: _inputDecoration('Tanggal Lahir (YYYY-MM-DD)'),
                validator: (value) =>
                    value!.isEmpty ? 'Tanggal lahir wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telpController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Nomor Telepon'),
                validator: (value) =>
                    value!.isEmpty ? 'Nomor telepon wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alamatController,
                maxLines: 3,
                decoration: _inputDecoration('Alamat Lengkap'),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat wajib diisi' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final pasienBaru = Pasien(
                      id:
                          widget.pasien?.id ??
                          DateTime.now().millisecondsSinceEpoch,
                      nomorRm: _noRmController.text,
                      nama: _namaController.text,
                      tanggalLahir: _tglLahirController.text,
                      nomorTelepon: _telpController.text,
                      alamat: _alamatController.text,
                    );
                    Navigator.pop(context, pasienBaru);
                  }
                },
                icon: const Icon(Icons.save_rounded, color: Colors.white),
                label: Text(
                  widget.pasien == null ? 'Simpan' : 'Perbarui',
                  style: const TextStyle(
                    color: Colors.white, // label putih
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: Colors.blueAccent.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
