import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  final Pegawai?
  pegawai; // tambahkan ini agar bisa null (untuk tambah atau edit)

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
    // Jika mode edit, isi form dengan data pegawai lama
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pegawai == null ? 'Tambah Pegawai' : 'Ubah Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nipController,
                decoration: const InputDecoration(labelText: 'NIP'),
              ),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _tglLahirController,
                decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
              ),
              TextFormField(
                controller: _telpController,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
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
                },
                child: Text(widget.pegawai == null ? 'Simpan' : 'Perbarui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
