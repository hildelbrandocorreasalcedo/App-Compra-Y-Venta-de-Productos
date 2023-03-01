class CompraFinal {
  var id_compra;
  var nombreCompra;
  var total;

  CompraFinal({
    this.id_compra,
    this.nombreCompra,
    this.total,
  });

  factory CompraFinal.fromJson(Map<String, dynamic> json) {
    return CompraFinal(
      id_compra: json['id'],
      nombreCompra: json['nombreCompra'],
      total: json['total'],
    );
  }
}
