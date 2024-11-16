import 'dart:collection';

import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';

class LugaresFavoritosProvider extends ChangeNotifier {
  List<Lugar> _lista = [];

  UnmodifiableListView<Lugar> get lista => UnmodifiableListView(_lista);

  void toggleFavorito(Lugar lugar) {
    if (_lista.contains(lugar)) {
      _lista.remove(lugar);
    } else {
      _lista.add(lugar);
    }

    notifyListeners();
  }

  bool isFavorito(Lugar lugar){
    return _lista.contains(lugar);
  }
}
