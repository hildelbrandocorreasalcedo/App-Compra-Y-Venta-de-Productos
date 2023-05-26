class CompraTemp {
  final String id_compraTemp;
  final String producto;
  final String cantidad;
  final String valorProducto;
  final String foto;

  CompraTemp(
      {required this.id_compraTemp,
      required this.producto,
      required this.cantidad,
      required this.valorProducto,
      required this.foto});

  factory CompraTemp.fromJson(Map<String, dynamic> json) {
    return CompraTemp(
      id_compraTemp: json['id'],
      producto: json['producto'],
      cantidad: json['cantidad'],
      valorProducto: json['valorProducto'],
      foto: json['foto'],
    );
  }
}
