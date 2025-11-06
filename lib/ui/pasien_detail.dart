import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_form.dart';

class PasienDetail extends StatelessWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pasien")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nomor RM: ${pasien.nomorRm}",
              style: const TextStyle(fontSize: 18),
            ),
            Text("Nama: ${pasien.nama}", style: const TextStyle(fontSize: 18)),
            Text(
              "Tanggal Lahir: ${pasien.tanggalLahir}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "No. Telepon: ${pasien.nomorTelepon}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Alamat: ${pasien.alamat}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasienForm(pasien: pasien),
                      ),
                    );
                  },
                  child: const Text("Ubah"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
