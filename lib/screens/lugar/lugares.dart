import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/providers/lugares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugaresManageScreen extends StatelessWidget {
  const LugaresManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lugares = Provider.of<LugaresProvider>(context).lista;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lugares",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
        actions: [
          // Adiciona um ícone no canto direito da AppBar
          IconButton(
            icon: const Icon(Icons.add), // Ícone de adicionar
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '/lugares/adicionar',
              );
            },
            tooltip:
                'Adicionar Lugar', // Tooltip que aparece ao passar o mouse ou segurar
          ),
        ],
      ),
      drawer: const MeuDrawer(),
      body: lugares.isEmpty
          ? const Center(child: Text('Nenhum lugar cadastrado.'))
          : ListView.builder(
              itemCount: lugares
                  .length, // Usando o tamanho da lista de lugares do provider
              itemBuilder: (context, index) {
                return ItemLugar(lugar: lugares[index]);
              },
            ),
    );
  }
}
