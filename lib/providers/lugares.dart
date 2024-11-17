import 'dart:collection';

import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';

class LugaresProvider extends ChangeNotifier {
  List<Lugar> _lista = [];

  UnmodifiableListView<Lugar> get lista => UnmodifiableListView(_lista);

  void saveLugar(Lugar lugar) {
    _lista.add(lugar);

    notifyListeners();
  }

  void removeLugar(Lugar lugar) {
    _lista.remove(lugar);

    notifyListeners();
  }
}
