import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  // --- Palet Warna Profesional dan Modern ---
  static const Color _primaryColor = Color(0xFF3A5BA0); // Biru elegan
  static const Color _secondaryColor = Color(
    0xFF6F74DD,
  ); // Biru keunguan lembut
  static const Color _accentColor = Color(0xFFF5F7FA); // Background abu terang
  static const Color _textColor = Color(0xFF2C2C2C); // Hitam lembut
  static const Color _subtitleColor = Color(0xFF6E6E6E); // Abu untuk subteks

  // Daftar Poli
  List<Poli> daftarPoli = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  final List<IconData> _icons = [
    Icons.child_care_rounded,
    Icons.medical_services_rounded,
    Icons.health_and_safety_rounded,
    Icons.healing_rounded,
    Icons.visibility_rounded,
    Icons.hearing_rounded,
    Icons.food_bank_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _accentColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Poliklinik Sehat",
          style: TextStyle(
            color: _primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: _primaryColor),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _secondaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Tambah Poli",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PoliForm()),
          );
          if (hasil != null && hasil is Poli) {
            setState(() {
              daftarPoli.add(hasil);
            });
          }
        },
      ),
      body: Column(
        children: [
          _headerSection(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              itemCount: daftarPoli.length,
              itemBuilder: (context, index) {
                final poli = daftarPoli[index];
                final icon = _icons[index % _icons.length];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoliDetail(poli: poli),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      leading: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [_primaryColor, _secondaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Icon(icon, color: Colors.white, size: 28),
                      ),
                      title: Text(
                        poli.namaPoli,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: _textColor,
                        ),
                      ),
                      subtitle: const Text(
                        "Layanan kesehatan terbaik dan profesional",
                        style: TextStyle(color: _subtitleColor, fontSize: 13.5),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Header Modern
  Widget _headerSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [_primaryColor, _secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: _secondaryColor.withOpacity(0.4),
            blurRadius: 14,
            offset: const Offset(0, 6),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Selamat Datang!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Temukan layanan poliklinik sesuai kebutuhan Anda.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
