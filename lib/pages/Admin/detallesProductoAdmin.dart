import 'package:best_parking_app_firebase/pages/login.dart';
import 'package:flutter/material.dart';

import '../../peticiones/peticionesProducto.dart';

class detallesProducto extends StatefulWidget {
  final iddoc;
  final pos;
  final List perfil;
  detallesProducto({required this.perfil, this.pos, this.iddoc});

  @override
  _detallesProductoState createState() => _detallesProductoState();
}

class _detallesProductoState extends State<detallesProducto> {
  TextEditingController controlTipo = TextEditingController();
  TextEditingController controlAlimento = TextEditingController();
  TextEditingController controlValorAlimento = TextEditingController();
  TextEditingController controlCantidadProducto = TextEditingController();
  TextEditingController controlFoto = TextEditingController();
  TextEditingController controlEstado = TextEditingController();

  @override
  void initState() {
    controlTipo =
        TextEditingController(text: widget.perfil[widget.pos]['tipo']);
    controlAlimento =
        TextEditingController(text: widget.perfil[widget.pos]['alimento']);
    controlValorAlimento =
        TextEditingController(text: widget.perfil[widget.pos]['valoralimento']);
    controlCantidadProducto = TextEditingController(
        text: widget.perfil[widget.pos]['cantidadProducto']);
    controlFoto =
        TextEditingController(text: widget.perfil[widget.pos]['foto']);
    controlEstado =
        TextEditingController(text: widget.perfil[widget.pos]['estado']);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Fast Food',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          //title: Image.asset('img/icono.png', scale: 22),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.white)
                ], shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.home),
                  color: Colors.blue.shade400,
                  tooltip: 'Regresar',
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "Detalles del producto",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Prompt',
              ),
            ),
          ),
          /////////////////////////////////////////////////////////7
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.all(15),
              elevation: 10,

              // Dentro de esta propiedad usamos ClipRRect
              child: ClipRRect(
                // Los bordes del contenido del card se cortan usando BorderRadius
                borderRadius: BorderRadius.circular(30),

                // EL widget hijo que será recortado segun la propiedad anterior
                child: Column(
                  children: <Widget>[
                    // Usamos el widget Image para mostrar una imagen
                    Image(image: NetworkImage(controlFoto.text)),

                    // Usamos Container para el contenedor de la descripción
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 5,
                            left: (MediaQuery.of(context).size.width / 2) - 135,
                            child: Container(
                              //
                              height: 60,
                              width: 200,
                              child: Card(
                                elevation: 2,
                                color: Colors.blue[200],
                                child: Center(
                                  child: Text(
                                    controlTipo.text,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 100),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          cursorColor: Colors.red.shade400,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Prompt',
                                          ),
                                          controller: controlAlimento,
                                          decoration: InputDecoration(
                                              icon:
                                                  Icon(Icons.text_fields_sharp),
                                              labelText: 'Alimento'),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          cursorColor: Colors.red.shade400,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Prompt',
                                          ),
                                          controller: controlValorAlimento,
                                          decoration: InputDecoration(
                                              icon:
                                                  Icon(Icons.text_fields_sharp),
                                              labelText: 'Valor Alimento'),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          cursorColor: Colors.red.shade400,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Prompt',
                                          ),
                                          controller: controlCantidadProducto,
                                          decoration: InputDecoration(
                                              icon:
                                                  Icon(Icons.text_fields_sharp),
                                              labelText:
                                                  'Cantidad de productos'),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: TextField(
                                          cursorColor: Colors.red.shade400,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Prompt',
                                          ),
                                          controller: controlFoto,
                                          decoration: InputDecoration(
                                              icon:
                                                  Icon(Icons.text_fields_sharp),
                                              labelText: 'Foto del producto'),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(''),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(width: 16),
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              var producto = <String, dynamic>{
                                                'alimento':
                                                    controlAlimento.text,
                                                'valoralimento':
                                                    controlValorAlimento.text,
                                                'estado': controlEstado.text,
                                                'cantidadProducto':
                                                    controlCantidadProducto
                                                        .text,
                                                'tipo': controlTipo.text,
                                                'foto': controlFoto.text,
                                              };
                                              PeticionesProducto
                                                  .actualizarProducto(
                                                      widget.perfil[widget.pos]
                                                          .id,
                                                      producto);
                                              Navigator.of(context).pop();
                                            },
                                            label: const Text(
                                                'Actualizar Producto'),
                                            icon: const Icon(Icons.update),
                                          ),
                                        ],
                                      ),
                                      Text(''),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(width: 16),
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              PeticionesProducto
                                                  .eliminarProducto(widget
                                                      .perfil[widget.pos].id);
                                              Navigator.of(context).pop();
                                            },
                                            label:
                                                const Text('Eliminar Producto'),
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                      Text(''),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          //////////////////////////////////////////////////////////////////////////////7
        ],
      ),
    );
  }
}
