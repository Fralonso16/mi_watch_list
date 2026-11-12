import 'package:flutter/material.dart';

import 'pantallas/pantalla_lista.dart';

void main() => runApp(const MiWatchlist());

/// TODO(alumno): raíz de la app; aquí se define el tema.
class MiWatchlist extends StatelessWidget {
  const MiWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Watchlist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PantallaLista(),
    );
  }
}
