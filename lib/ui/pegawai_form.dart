import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  final Pegawai? pegawai;

  const PegawaiForm({super.key, this.pegawai});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _namaController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _telpController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.pegawai != null) {
      _nipController.text = widget.pegawai!.nip;
      _namaController.text = widget.pegawai!.nama;
      _tglLahirController.text = widget.pegawai!.tanggalLahir;
      _telpController.text = widget.pegawai!.nomorTelepon;
      _emailController.text = widget.pegawai!.email;
      _passwordController.text = widget.pegawai!.password;
    }
  }

  @override
  void dispose() {
    _nipController.dispose();
    _namaController.dispose();
    _tglLahirController.dispose();
    _telpController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blueAccent),
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
          widget.pegawai == null ? 'Tambah Pegawai' : 'Ubah Data Pegawai',
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
                controller: _nipController,
                decoration: _inputDecoration('NIP', Icons.badge_rounded),
                validator: (value) => value!.isEmpty ? 'NIP wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _namaController,
                decoration: _inputDecoration('Nama Lengkap', Icons.person),
                validator: (value) =>
                    value!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tglLahirController,
                decoration: _inputDecoration(
                  'Tanggal Lahir (YYYY-MM-DD)',
                  Icons.calendar_today,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Tanggal lahir wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telpController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration(
                  'Nomor Telepon',
                  Icons.phone_rounded,
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nomor telepon wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('Email', Icons.email_rounded),
                validator: (value) =>
                    value!.isEmpty ? 'Email wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _inputDecoration('Password', Icons.lock_rounded),
                validator: (value) =>
                    value!.isEmpty ? 'Password wajib diisi' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final pegawaiBaru = Pegawai(
                      id:
                          widget.pegawai?.id ??
                          DateTime.now().millisecondsSinceEpoch,
                      nip: _nipController.text,
                      nama: _namaController.text,
                      tanggalLahir: _tglLahirController.text,
                      nomorTelepon: _telpController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    Navigator.pop(context, pegawaiBaru);
                  }
                },
                icon: const Icon(Icons.save_rounded, color: Colors.white),
                label: Text(
                  widget.pegawai == null ? 'Simpan' : 'Perbarui',
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
