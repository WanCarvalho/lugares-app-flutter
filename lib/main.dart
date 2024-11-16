import 'package:f05_lugares_app/providers/lugares_favoritos.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LugaresFavoritosProvider(),
      child: MeuApp(),
    ),
  );
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => MinhasAbas(),
        '/lugaresPorPais': (ctx) => LugarPorPaisScreen(),
        '/detalheLugar': (ctx) => DetalhesLugarScreen(),
        '/configuracoes': (ctx) => ConfigracoesScreen(),
      },
    );

    /* return MaterialApp.router(
      routerConfig: minhasRotas.getRouter(),
    ); */
  }
}
