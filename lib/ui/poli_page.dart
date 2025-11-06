import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  List<Poli> daftarPoli = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
    Poli(namaPoli: "Poli Kandungan"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 36, 238),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add, color: Colors.white),
            onTap: () async {
              // buka halaman form dan tunggu hasilnya
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );

              // kalau hasilnya bukan null, tambahkan ke list
              if (hasil != null && hasil is Poli) {
                setState(() {
                  daftarPoli.add(hasil);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPoli.length,
        itemBuilder: (context, index) {
          final poli = daftarPoli[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
              );
            },
            child: PoliItem(poli: poli),
          );
        },
      ),
    );
  }
}
