import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeticionesProducto {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('producto');

    return listado.snapshots();
  }

  static Future<void> crearProducto(Map<String, dynamic> producto) async {
    await _db.collection('producto').doc().set(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

//'MWPy56bgx9wYBzul88rR'
  static Future<void> actualizarProducto(
      String id, Map<String, dynamic> producto) async {
    await _db.collection('producto').doc(id).update(producto).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarProducto(String id) async {
    await _db.collection('producto').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
