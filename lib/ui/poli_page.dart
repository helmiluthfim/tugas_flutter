import 'package:flutter/material.dart';
import 'poli_detail.dart';
import 'poli_form.dart';
import '../model/poli.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({Key? key}) : super(key: key);

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  List<Poli> daftarPoli = [
    Poli(namaPoli: "Poli Umum"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli Anak"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        title: const Text(
          "Daftar Poli",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: daftarPoli.length,
          itemBuilder: (context, index) {
            final poli = daftarPoli[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoliDetail(poli: poli),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.blueAccent.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.local_hospital,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      poli.namaPoli,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      "ID: ${poli.id}",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.blueAccent,
                      size: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
