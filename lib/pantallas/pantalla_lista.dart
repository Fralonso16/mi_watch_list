import 'package:flutter/material.dart';

import '../modelos/elemento.dart';

/// TODO(alumno): pantalla principal. En la fase 1 solo muestra datos de ejemplo.
class PantallaLista extends StatelessWidget {
  const PantallaLista({super.key});

  // Datos de ejemplo escritos a mano; se quitarán al llegar a la persistencia.
  static final List<Elemento> _ejemplos = [
    Elemento(
      id: '1',
      titulo: 'Dune: Parte 2',
      tipo: Tipo.pelicula,
      estado: Estado.pendiente,
      fechaAlta: DateTime(2026, 11, 1),
    ),
    Elemento(
      id: '2',
      titulo: 'The Bear',
      tipo: Tipo.serie,
      estado: Estado.enCurso,
      valoracion: 4,
      fechaAlta: DateTime(2026, 11, 2),
    ),
    Elemento(
      id: '3',
      titulo: 'Hollow Knight',
      tipo: Tipo.videojuego,
      estado: Estado.terminado,
      valoracion: 5,
      notas: 'Obra maestra',
      fechaAlta: DateTime(2026, 11, 3),
    ),
    Elemento(
      id: '4',
      titulo: 'Breaking Bad',
      tipo: Tipo.serie,
      estado: Estado.terminado,
      valoracion: 5,
      fechaAlta: DateTime(2026, 11, 4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Watchlist')),
      body: ListView(
        children: [
          for (final e in _ejemplos)
            ListTile(
              title: Text(e.titulo),
              subtitle: Text('${e.tipo.etiqueta} · ${e.estado.etiqueta}'),
              trailing: Text('${e.valoracion}★'),
            ),
        ],
      ),
    );
  }
}
