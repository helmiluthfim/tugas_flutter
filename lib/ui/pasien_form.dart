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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pasien == null ? 'Tambah Pasien' : 'Ubah Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _noRmController,
                decoration: const InputDecoration(labelText: 'Nomor RM'),
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
                controller: _alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
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
                },
                child: Text(widget.pasien == null ? 'Simpan' : 'Perbarui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
