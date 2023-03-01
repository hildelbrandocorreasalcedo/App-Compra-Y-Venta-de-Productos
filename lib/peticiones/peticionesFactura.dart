import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeticionesFactura {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('Factura');

    return listado.snapshots();
  }

  static Future<void> crearFactura(Map<String, dynamic> producto) async {
    await _db.collection('Factura').doc().set(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> actualizarFactura(
      String id, Map<String, dynamic> producto) async {
    await _db.collection('Factura').doc(id).update(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarFactura(String id) async {
    await _db.collection('Factura').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
