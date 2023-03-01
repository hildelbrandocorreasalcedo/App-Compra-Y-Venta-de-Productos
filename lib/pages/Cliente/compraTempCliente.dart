import 'package:best_parking_app_firebase/pages/Cliente/facturaCliente.dart';
import 'package:best_parking_app_firebase/peticiones/peticionesProducto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../peticiones/peticionesCompraTemp.dart';
import 'detallesProductoCliente.dart';

class CompraTempCliente extends StatefulWidget {
  CompraTempCliente();

  @override
  _CompraTempClienteState createState() => _CompraTempClienteState();
}

class _CompraTempClienteState extends State<CompraTempCliente> {
  @override
  void initState() {
    super.initState();
  }

  int totalPagar = 0;
  final List listaPagar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getInfo(context),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //comprarDefinitivo(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FacturaCliente()));
        },
        tooltip: 'Pagar',
        child: Icon(Icons.monetization_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget getInfo(BuildContext context) {
  return StreamBuilder(
    stream: PeticionesCompraTemp.readItems(),
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {
        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          print(snapshot.data);
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          print(snapshot.data);
          return snapshot.data != null

              //? ListItemWidget(productos: snapshot.data!.docs)
              ? VistaProductosComprados(productos: snapshot.data!.docs)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaProductosComprados extends StatelessWidget {
  final List productos;

  const VistaProductosComprados({required this.productos});

  @override
  Widget build(BuildContext context) {
    //if (parqueos['estado'] == 'ACTIVO') {}
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: productos.length == 0 ? 0 : productos.length,
            itemBuilder: (context, posicion) {
              return ListTile(
                onTap: () {
                  PeticionesCompraTemp.eliminarProducto(productos[posicion].id);
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              detallesProductoCliente(
                                  perfil: productos,
                                  pos: posicion,
                                  iddoc: productos[posicion].id)));*/
                },
                leading: Container(
                  padding: EdgeInsets.all(5.0),
                  width: 80,
                  height: 80,
                  child:
                      Image(image: NetworkImage(productos[posicion]['foto'])),
                ),
                title: Text(
                  productos[posicion]['producto'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Prompt'),
                ),
                subtitle: Text(
                  "Costo unidad: " + productos[posicion]['valorProducto'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                ),
                trailing: Text(
                  "Comprado: " + productos[posicion]['cantidad'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                ),
              );
              //if
            }),
      ),
    );
  }
}

/////////////////////////////////////////////////////////


