class Producto {
  final String id_producto;
  final String tipo;
  final String alimento;
  final String valoralimento;
  final String cantidadProducto;
  final String foto;
  final String totalpagar;
  final String estado;

  Producto({
    required this.id_producto,
    required this.tipo,
    required this.alimento,
    required this.valoralimento,
    required this.cantidadProducto,
    required this.foto,
    required this.totalpagar,
    required this.estado,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id_producto: json['id_producto'],
      tipo: json['tipo'],
      alimento: json['alimento'],
      valoralimento: json['valoralimento'],
      cantidadProducto: json['cantidadProducto'],
      foto: json['foto'],
      totalpagar: json['totalpagar'],
      estado: json['estado'],
    );
  }
}
