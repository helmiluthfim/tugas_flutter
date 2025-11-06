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
  List<Pegawai> pegawaiList = [
    Pegawai(
      id: 1,
      nip: 'DR001',
      nama: 'Dr. Richard',
      tanggalLahir: '1980-10-23',
      nomorTelepon: '081234567890',
      email: 'richard@gmail.com',
      password: '12345',
    ),
  ];

  List<Pasien> pasienList = [
    Pasien(
      id: 1,
      nomorRm: 'RM121',
      nama: 'Tatang',
      tanggalLahir: '2000-01-05',
      nomorTelepon: '082145678901',
      alamat: 'Bandar Lampung',
    ),
  ];

  // 🎨 Warna Tema Baru
  static const Color _primaryColor = Color(0xFF3A5BA0);
  static const Color _secondaryColor = Color(0xFF6F74DD);
  static const Color _backgroundColor = Color(0xFFF4F6FA);
  static const Color _cardColor = Colors.white;
  static const Color _textColor = Color(0xFF2C2C2C);
  static const Color _subtitleColor = Color(0xFF6E6E6E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _cardColor,
        elevation: 1.5,
        centerTitle: true,
        title: const Text(
          "Detail Poliklinik",
          style: TextStyle(
            color: _primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: _primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerPoli(),
            const SizedBox(height: 28),
            _sectionHeader(
              title: "Pegawai Poliklinik",
              onAdd: () async {
                final newPegawai = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PegawaiForm()),
                );
                if (newPegawai != null && newPegawai is Pegawai) {
                  setState(() => pegawaiList.add(newPegawai));
                }
              },
            ),
            _buildPegawaiList(),
            const SizedBox(height: 28),
            _sectionHeader(
              title: "Daftar Pasien",
              onAdd: () async {
                final newPasien = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasienForm()),
                );
                if (newPasien != null && newPasien is Pasien) {
                  setState(() => pasienList.add(newPasien));
                }
              },
            ),
            _buildPasienList(),
            const SizedBox(height: 36),
            _actionButtons(),
          ],
        ),
      ),
    );
  }

  // 🔹 HEADER POLI DENGAN GRADIENT & EFEK MODERN
  Widget _headerPoli() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primaryColor, _secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.local_hospital_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              widget.poli.namaPoli,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 HEADER BAGIAN (Pegawai / Pasien)
  Widget _sectionHeader({required String title, required VoidCallback onAdd}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _primaryColor,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add_circle_rounded,
            color: _secondaryColor,
            size: 28,
          ),
          onPressed: onAdd,
        ),
      ],
    );
  }

  // 🔹 LIST PEGAWAI MODERN
  Widget _buildPegawaiList() {
    return Column(
      children: pegawaiList.map((pegawai) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: _secondaryColor.withOpacity(0.9),
              child: const Icon(Icons.person, color: Colors.white, size: 28),
            ),
            title: Text(
              pegawai.nama,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: _textColor,
              ),
            ),
            subtitle: Text(
              "NIP: ${pegawai.nip}\nEmail: ${pegawai.email}",
              style: const TextStyle(color: _subtitleColor, height: 1.4),
            ),
            isThreeLine: true,
            trailing: _buildActionIcons(
              onEdit: () async {
                final updatedPegawai = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PegawaiForm(pegawai: pegawai),
                  ),
                );
                if (updatedPegawai != null && updatedPegawai is Pegawai) {
                  setState(() {
                    final index = pegawaiList.indexOf(pegawai);
                    pegawaiList[index] = updatedPegawai;
                  });
                }
              },
              onDelete: () => _hapusDataPegawai(pegawai),
            ),
          ),
        );
      }).toList(),
    );
  }

  // 🔹 LIST PASIEN MODERN
  Widget _buildPasienList() {
    return Column(
      children: pasienList.map((pasien) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: _primaryColor,
              child: const Icon(
                Icons.local_hospital,
                color: Colors.white,
                size: 26,
              ),
            ),
            title: Text(
              pasien.nama,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: _textColor,
              ),
            ),
            subtitle: Text(
              "No. RM: ${pasien.nomorRm}\nTelp: ${pasien.nomorTelepon}\nAlamat: ${pasien.alamat}",
              style: const TextStyle(color: _subtitleColor, height: 1.4),
            ),
            isThreeLine: true,
            trailing: _buildActionIcons(
              onEdit: () async {
                final updatedPasien = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienForm(pasien: pasien),
                  ),
                );
                if (updatedPasien != null && updatedPasien is Pasien) {
                  setState(() {
                    final index = pasienList.indexOf(pasien);
                    pasienList[index] = updatedPasien;
                  });
                }
              },
              onDelete: () => _hapusDataPasien(pasien),
            ),
          ),
        );
      }).toList(),
    );
  }

  // 🔹 KOMPONEN ICON AKSI
  Widget _buildActionIcons({
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit_rounded, color: Colors.green),
          onPressed: onEdit,
        ),
        IconButton(
          icon: const Icon(
            Icons.delete_forever_rounded,
            color: Colors.redAccent,
          ),
          onPressed: onDelete,
        ),
      ],
    );
  }

  // 🔹 KONFIRMASI HAPUS PEGAWAI
  void _hapusDataPegawai(Pegawai pegawai) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Hapus Data Pegawai"),
        content: Text("Apakah Anda yakin ingin menghapus ${pegawai.nama}?"),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text("Hapus"),
            onPressed: () {
              setState(() => pegawaiList.remove(pegawai));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // 🔹 KONFIRMASI HAPUS PASIEN
  void _hapusDataPasien(Pasien pasien) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Hapus Data Pasien"),
        content: Text("Apakah Anda yakin ingin menghapus ${pasien.nama}?"),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text("Hapus"),
            onPressed: () {
              setState(() => pasienList.remove(pasien));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // 🔹 TOMBOL AKSI UTAMA
  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PoliUpdateForm(poli: widget.poli),
              ),
            );
          },
          icon: const Icon(Icons.edit_rounded, color: Colors.white),
          label: Text(
            "Ubah",
            style: const TextStyle(
              color: Colors.white, // Warna teks putih
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white, // Pastikan ikon/teks putih
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            shadowColor: Colors.green.withOpacity(0.4),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.delete_rounded, color: Colors.white),
          label: Text(
            "Hapus",
            style: const TextStyle(
              color: Colors.white, // Warna teks putih
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white, // Ikon & teks putih
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            shadowColor: Colors.redAccent.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
