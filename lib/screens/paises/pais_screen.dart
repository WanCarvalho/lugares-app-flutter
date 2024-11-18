import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/components/item_pais.dart';
import 'package:f05_lugares_app/providers/paises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaisScreen extends StatelessWidget {
  const PaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paises = Provider.of<PaisesProvider>(context).lista;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Países",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
        actions: [
          // Adiciona um ícone no canto direito da AppBar
          IconButton(
            icon: const Icon(Icons.add), // Ícone de adicionar
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                '/paises/adicionar',
              );
            },
            tooltip:
                'Adicionar País', // Tooltip que aparece ao passar o mouse ou segurar
          ),
        ],
      ),
      drawer: const MeuDrawer(),
      body: paises.isEmpty
          ? const Center(child: Text('Nenhum país cadastrado.'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 120,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
              ),
              itemCount: paises
                  .length, // Usando o tamanho da lista de lugares do provider
              itemBuilder: (context, index) {
                return ItemPais(pais: paises[index]);
              },
            ),
    );
  }
}
