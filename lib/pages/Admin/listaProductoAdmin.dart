import 'package:best_parking_app_firebase/pages/Admin/detallesProductoAdmin.dart';
import 'package:best_parking_app_firebase/peticiones/peticionesProducto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaProductos extends StatefulWidget {
  ListaProductos();

  @override
  _ListaProductosState createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getInfo(context),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Refrescar',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget getInfo(BuildContext context) {
  return StreamBuilder(
    stream: PeticionesProducto.readItems(),
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
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              //? ListItemWidget(productos: snapshot.data!.docs)
              ? VistaParqueos(productos: snapshot.data!.docs)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaParqueos extends StatelessWidget {
  final List productos;

  const VistaParqueos({required this.productos});

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => detallesProducto(
                              perfil: productos,
                              pos: posicion,
                              iddoc: productos[posicion].id)));
                },
                leading: Container(
                  padding: EdgeInsets.all(5.0),
                  width: 80,
                  height: 80,
                  child:
                      Image(image: NetworkImage(productos[posicion]['foto'])),
                ),
                title: Text(
                  productos[posicion]['alimento'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Prompt'),
                ),
                subtitle: Text(
                  "Costo unidad: " + productos[posicion]['valoralimento'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                ),
                trailing: Container(
                  width: 20,
                  /*color: Colors.yellow,*/
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            productos[posicion]['estado'] == 'DISPONIBLE'
                                ? Colors.green
                                : Colors.red,
                      ),
                    ],
                  ),
                ),
              );
              //if
            }),
      ),
    );
  }
}
/////////////////////////////////////////////////////////

class ListItemWidget extends StatelessWidget {
  final List productos;

  const ListItemWidget({required this.productos});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: productos.length == 0 ? 0 : productos.length,
      itemBuilder: (context, posicion) {
        return Dismissible(
          key: Key(productos[posicion]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 5,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(productos[posicion]['foto']))),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productos[posicion]['alimento'],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "3D",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                "His genius finally recognized by his idol Chester",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
