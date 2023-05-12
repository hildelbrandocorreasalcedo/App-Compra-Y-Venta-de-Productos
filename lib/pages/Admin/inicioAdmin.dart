import 'package:best_parking_app_firebase/pages/Admin/detallesProductoAdmin.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Client/consultarFinanzas.dart';
import 'ingresoProductoAdmin.dart';
import '../login.dart';
import 'listaProductoAdmin.dart';

class inicioAdmin extends StatefulWidget {
  const inicioAdmin({super.key});

  @override
  State<inicioAdmin> createState() => _inicioAdminState();
}

class _inicioAdminState extends State<inicioAdmin> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int indice = 0;

  final paginas = [
    AgregarProducto(),
    ListaProductos(),
    //ConsultaFinacieraDia(),
    //ListarTotalParqueos(),
    //ConsultaFinacieraDia(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.add_to_photos_sharp,
        size: 30,
      ),
      Icon(
        Icons.list,
        size: 30,
      ),
    ];

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
                                  builder: (BuildContext context) => Login()));
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
        //drawer: Drawer(),paginas:[indice],
        body: paginas[indice],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.blue.shade400,
            backgroundColor: Colors.transparent,
            height: 50,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(microseconds: 300),
            index: indice,
            items: items,
            onTap: (index) => setState(() {
              indice = index;
            }),
          ),
        ),
      ),
    );
  }
}
