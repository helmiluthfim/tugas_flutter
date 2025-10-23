import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Poli")),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Poli Anak"))),
            onTap: () {
              Poli poliAnak = Poli(namaPoli: "Poli Anak");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliAnak),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Poli Kandungan"))),
            onTap: () {
              Poli poliKandungan = Poli(namaPoli: "Poli Kandungan");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliKandungan),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Poli Gigi"))),
            onTap: () {
              Poli poliGigi = Poli(namaPoli: "Poli Gigi");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliGigi),
                ),
              );
            },
          ),
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Poli THT"))),
            onTap: () {
              Poli poliTHT = Poli(namaPoli: "Poli THT");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliTHT),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
