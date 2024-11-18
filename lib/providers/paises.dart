import 'dart:collection';

import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';

class PaisesProvider extends ChangeNotifier {
  List<Pais> _lista = [];

  UnmodifiableListView<Pais> get lista => UnmodifiableListView(_lista);

  void savePais(Pais pais) {
    _lista.add(pais);

    notifyListeners();
  }

  void removePais(Pais pais) {
    _lista.remove(pais);

    notifyListeners();
  }
}
