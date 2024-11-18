import 'package:f05_lugares_app/providers/lugares.dart';
import 'package:f05_lugares_app/providers/lugares_favoritos.dart';
import 'package:f05_lugares_app/providers/paises.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/lugar/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugar/lugares.dart';
import 'package:f05_lugares_app/screens/lugar/lugares_form.dart';
import 'package:f05_lugares_app/screens/lugar/lugares_por_pais.dart';
import 'package:f05_lugares_app/screens/paises/paises_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LugaresFavoritosProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LugaresProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaisesProvider(),
        ),
      ],
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
        '/lugares-manage': (ctx) => LugaresManageScreen(),
        '/lugares/adicionar': (ctx) => LugaresForm(),
        '/paises/adicionar': (ctx) => PaisesForm(),
      },
    );

    /* return MaterialApp.router(
      routerConfig: minhasRotas.getRouter(),
    ); */
  }
}
