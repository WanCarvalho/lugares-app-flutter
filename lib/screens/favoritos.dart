import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/providers/lugares_favoritos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritos = Provider.of<LugaresFavoritosProvider>(context).lista;

    if (favoritos.isEmpty) {
      return const Center(
        child: Text('Nenhum Lugar Marcado como Favorito!', style: TextStyle(fontSize: 20),),
      );
    } else {
      return ListView.builder(
          itemCount: favoritos.length,
          itemBuilder: (ctx, index) {
            return ItemLugar(lugar: favoritos.elementAt(index),);
          });
    }
  }
}