/// TODO(alumno): explica con tus palabras para qué sirve este enum.
enum Tipo {
  pelicula('Película'),
  serie('Serie'),
  videojuego('Videojuego');

  const Tipo(this.etiqueta);

  /// TODO(alumno): texto que se muestra en pantalla (el nombre del enum no es bonito).
  final String etiqueta;
}

/// TODO(alumno): explica con tus palabras para qué sirve este enum.
enum Estado {
  pendiente('Pendiente'),
  enCurso('Viendo/Jugando'),
  terminado('Terminado');

  const Estado(this.etiqueta);

  /// TODO(alumno): texto que se muestra en pantalla.
  final String etiqueta;
}

/// TODO(alumno): explica qué representa un Elemento y por qué es inmutable.
class Elemento {
  const Elemento({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.estado,
    required this.fechaAlta,
    this.valoracion = 0,
    this.notas,
  });

  final String id;
  final String titulo;
  final Tipo tipo;
  final Estado estado;

  /// De 0 a 5. 0 significa «sin valorar».
  final int valoracion;
  final String? notas;
  final DateTime fechaAlta;

  /// TODO(alumno): explica por qué se necesita copyWith si los campos son final.
  ///
  /// Para dejar `notas` a null hay que pasar `borrarNotas: true`, porque pasar
  /// `notas: null` significaría «no cambiar».
  Elemento copyWith({
    String? titulo,
    Tipo? tipo,
    Estado? estado,
    int? valoracion,
    String? notas,
    bool borrarNotas = false,
  }) {
    return Elemento(
      id: id,
      titulo: titulo ?? this.titulo,
      tipo: tipo ?? this.tipo,
      estado: estado ?? this.estado,
      valoracion: valoracion ?? this.valoracion,
      notas: borrarNotas ? null : (notas ?? this.notas),
      fechaAlta: fechaAlta,
    );
  }

  /// TODO(alumno): explica cómo se guardan los enum y la fecha en JSON.
  Map<String, dynamic> toJson() => {
    'id': id,
    'titulo': titulo,
    'tipo': tipo.name,
    'estado': estado.name,
    'valoracion': valoracion,
    'notas': notas,
    'fechaAlta': fechaAlta.toIso8601String(),
  };

  /// TODO(alumno): explica qué pasa si el JSON no trae `notas`.
  factory Elemento.fromJson(Map<String, dynamic> json) => Elemento(
    id: json['id'] as String,
    titulo: json['titulo'] as String,
    tipo: Tipo.values.byName(json['tipo'] as String),
    estado: Estado.values.byName(json['estado'] as String),
    valoracion: json['valoracion'] as int? ?? 0,
    notas: json['notas'] as String?,
    fechaAlta: DateTime.parse(json['fechaAlta'] as String),
  );
}
