import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/data/dados.dart';
import 'package:flutter/material.dart';

class LugaresManageScreen extends StatelessWidget {
  const LugaresManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //prepara a lista de lugares por pais
    final List<Lugar> lugaresMock = lugares.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lugares",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      drawer: const MeuDrawer(),
      body: ListView.builder(
        itemCount: lugares.length,
        itemBuilder: (context, index) {
          return ItemLugar(lugar: lugaresMock.elementAt(index));
        },
      ),
    );
  }
}
