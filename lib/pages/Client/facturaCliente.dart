import 'package:best_parking_app_firebase/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../peticiones/peticionesCompraTemp.dart';

class FacturaCliente extends StatefulWidget {
  FacturaCliente();

  @override
  _FacturaClienteState createState() => _FacturaClienteState();
}

class _FacturaClienteState extends State<FacturaCliente> {
  @override
  void initState() {}

  int totalPagar = 0;
  final List listaPagar = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              /*title: Text(
              'GESTION DE PARQUEOS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),*/
              title: Image.asset('img/Icono.png', scale: 22),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7, spreadRadius: 3, color: Colors.white)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      iconSize: 25,
                      icon: const Icon(Icons.home),
                      color: Colors.blue.shade400,
                      tooltip: 'Salir',
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              ),
              centerTitle: true,
              toolbarHeight: 60,
              backgroundColor: Colors.blue.shade400,
              //elevation: 14,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70))),
              actions: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 7, spreadRadius: 3, color: Colors.white)
                      ], shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                        icon: const Icon(Icons.output_outlined),
                        color: Colors.blue.shade400,
                        tooltip: 'Salir',
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Login()));
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 26,
                    )
                  ],
                ),
              ]),
          body: comprarDefinitivo(context),

          /*floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Pagar',
            child: Icon(Icons.monetization_on),
          ),*/ // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

Widget comprarDefinitivo(BuildContext context) {
  return StreamBuilder(
    stream: PeticionesCompraTemp.readItems(),
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //print(snapshot.connectionState);
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
              ? FacturaProductosComprados(productos: snapshot.data!.docs)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class FacturaProductosComprados extends StatelessWidget {
  final List productos;

  const FacturaProductosComprados({required this.productos});

  @override
  Widget build(BuildContext context) {
    //if (parqueos['estado'] == 'ACTIVO') {}
    return Scaffold(
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Card(
                  elevation: 2,
                  color: Colors.blue[200],
                  child: Center(
                    child: Text(
                      "Total a Pagar\n" + calcularSumaTotalDia().toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Card(
                  elevation: 2,
                  color: Color.fromARGB(255, 19, 98, 163),
                  child: Center(
                    child: Text(
                      "Detalles de factura",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(35, 5, 35, 0),
            height: 690,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        ListView.builder(
                            itemCount:
                                productos.length == 0 ? 0 : productos.length,
                            itemBuilder: (context, posicion) {
                              return ListTile(
                                onTap: () {},
                                /*leading: Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 80,
                                  height: 80,
                                  child: Image(
                                      image: NetworkImage(
                                          productos[posicion]['foto'])),
                                ),*/
                                title: Text(
                                  productos[posicion]['producto'],
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'Prompt'),
                                ),
                                subtitle: Text(
                                  "Costo unidad: " +
                                      productos[posicion]['valorProducto'],
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      fontFamily: 'Prompt'),
                                ),
                                trailing: Text(
                                  "Comprado: " +
                                      productos[posicion]['cantidad'],
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      fontFamily: 'Prompt'),
                                ),
                              );
                              //if
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calcularSumaTotalDia() {
    double sumaTotal = 0;
    for (var producto in productos) {
      var totalpagar = int.parse(producto['valorProducto']) *
          int.parse(producto['cantidad']);

      sumaTotal = sumaTotal + totalpagar;
      //PeticionesCompraTemp.eliminarProducto(producto['id_compraTemp']);
    }
    return sumaTotal;
  }

  String eliminar(List<dynamic> productos, int posicion) {
    print("Elimino");
    PeticionesCompraTemp.eliminarProducto(productos[posicion].id);
    return "";
  }
}
