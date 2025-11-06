import 'package:flutter/material.dart';
import 'package:tugas_flutter/ui/pasien_form.dart';
import 'package:tugas_flutter/ui/pegawai_form.dart';
import 'poli_update_form.dart';
import '../model/poli.dart';
import '../model/pegawai.dart';
import '../model/pasien.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  // Data dummy sementara
  List<Pegawai> pegawaiList = [
    Pegawai(
      id: 1,
      nip: 'PG001',
      nama: 'Dr. Andi',
      tanggalLahir: '1980-03-12',
      nomorTelepon: '081234567890',
      email: 'andi@klinik.com',
      password: '12345',
    ),
  ];

  List<Pasien> pasienList = [
    Pasien(
      id: 1,
      nomorRm: 'RM001',
      nama: 'Budi Santoso',
      tanggalLahir: '2000-01-05',
      nomorTelepon: '082145678901',
      alamat: 'Jl. Melati No. 5',
    ),
    Pasien(
      id: 2,
      nomorRm: 'RM002',
      nama: 'Siti Aminah',
      tanggalLahir: '1998-07-15',
      nomorTelepon: '082345678902',
      alamat: 'Jl. Anggrek No. 10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul poli
            Text(
              "Nama Poli : ${widget.poli.namaPoli}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // --- BAGIAN PEGAWAI ---
            const Text(
              "Pegawai:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                // navigasi ke form tambah pegawai
                final newPegawai = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PegawaiForm()),
                );
                if (newPegawai != null && newPegawai is Pegawai) {
                  setState(() {
                    pegawaiList.add(newPegawai);
                  });
                }
              },
              child: const Text("Tambah Pegawai"),
            ),
            const SizedBox(height: 10),
            _buildPegawaiList(),

            const SizedBox(height: 20),

            // --- BAGIAN PASIEN ---
            const Text(
              "Pasien:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                // navigasi ke form tambah pasien
                final newPasien = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasienForm()),
                );
                if (newPasien != null && newPasien is Pasien) {
                  setState(() {
                    pasienList.add(newPasien);
                  });
                }
              },
              child: const Text("Tambah Pasien"),
            ),
            const SizedBox(height: 10),
            _buildPasienList(),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_tombolUbah(), _tombolHapus()],
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan daftar pegawai
  Widget _buildPegawaiList() {
    return Column(
      children: pegawaiList.map((pegawai) {
        return Card(
          child: ListTile(
            title: Text(pegawai.nama),
            subtitle: Text("NIP: ${pegawai.nip}\nEmail: ${pegawai.email}"),
            leading: const Icon(Icons.person),
          ),
        );
      }).toList(),
    );
  }

  // Menampilkan daftar pasien
  Widget _buildPasienList() {
    return Column(
      children: pasienList.map((pasien) {
        return Card(
          child: ListTile(
            title: Text(pasien.nama),
            subtitle: Text(
              "No. RM: ${pasien.nomorRm}\nTelp: ${pasien.nomorTelepon}\nAlamat: ${pasien.alamat}",
            ),
            leading: const Icon(Icons.local_hospital),
          ),
        );
      }).toList(),
    );
  }

  // Tombol ubah poli
  _tombolUbah() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PoliUpdateForm(poli: widget.poli),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  // Tombol hapus poli
  _tombolHapus() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
