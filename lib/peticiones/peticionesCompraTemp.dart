import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeticionesCompraTemp {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('CompraTemp');

    return listado.snapshots();
  }

  static Future<void> crearProducto(Map<String, dynamic> producto) async {
    await _db.collection('CompraTemp').doc().set(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> actualizarProducto(
      String id, Map<String, dynamic> producto) async {
    await _db.collection('CompraTemp').doc(id).update(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarProducto(String id) async {
    await _db.collection('CompraTemp').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
