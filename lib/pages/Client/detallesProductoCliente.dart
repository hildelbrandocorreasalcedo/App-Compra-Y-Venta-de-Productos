import 'package:best_parking_app_firebase/pages/login.dart';
import 'package:best_parking_app_firebase/peticiones/peticionesCompraTemp.dart';
import 'package:best_parking_app_firebase/peticiones/peticionesProducto.dart';
import 'package:flutter/material.dart';

class detallesProductoCliente extends StatefulWidget {
  final iddoc;
  final pos;
  final List perfil;
  detallesProductoCliente({required this.perfil, this.pos, this.iddoc});

  /*final idperfil;
  final List<dynamic> perfil;
  RetirarVehiculo({required this.perfil, this.idperfil});*/

  @override
  _detallesProductoClienteState createState() =>
      _detallesProductoClienteState();
}

class _detallesProductoClienteState extends State<detallesProductoCliente> {
  TextEditingController controlAlimento = TextEditingController();
  TextEditingController controlCantidadProducto = TextEditingController();
  TextEditingController controlEstado = TextEditingController();
  TextEditingController controlTipo = TextEditingController();
  TextEditingController controlValorAlimento = TextEditingController();
  TextEditingController controlFoto = TextEditingController();

  @override
  void initState() {
    controlAlimento =
        TextEditingController(text: widget.perfil[widget.pos]['alimento']);
    controlCantidadProducto = TextEditingController(
        text: widget.perfil[widget.pos]['cantidadProducto']);
    controlEstado =
        TextEditingController(text: widget.perfil[widget.pos]['estado']);
    controlTipo =
        TextEditingController(text: widget.perfil[widget.pos]['tipo']);
    controlValorAlimento =
        TextEditingController(text: widget.perfil[widget.pos]['valoralimento']);
    controlFoto =
        TextEditingController(text: widget.perfil[widget.pos]['foto']);

    // TODO: implement initState
    super.initState();
  }

  int _counter = 1;
  void _incrementarCantidad() {
    setState(() {
      int cantidad = int.parse(controlCantidadProducto.text);
      if (_counter < cantidad) {
        _counter++;
        print(_counter);
      } else {
        setState(() {});
      }
    });
  }

  void _decrementarCantidad() {
    setState(() {
      int cantidad = int.parse(controlCantidadProducto.text);

      if ((_counter > 1) && (0 < cantidad)) {
        _counter--;
        print(_counter);
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.white)
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
                                    controlAlimento.text,
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
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Column(
                                    children: [
                                      Text(
                                        '\nTipo:\n' + controlTipo.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(''),
                                      Text(
                                        'Valor Unitario:\n' +
                                            controlValorAlimento.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\nEstado:\n' + controlEstado.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\nCantidad Disponible:\n' +
                                            controlCantidadProducto.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(''),
                                      Text(
                                        'Cantidad a comprar:\n' + '$_counter',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(''),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(width: 16),
                                          // An example of the extended floating action button.
                                          //
                                          // https://m3.material.io/components/extended-fab/specs#686cb8af-87c9-48e8-a3e1-db9da6f6c69b
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              _incrementarCantidad();
                                            },
                                            label: const Text('Subir Cantidad'),
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                      Text(''),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const SizedBox(width: 16),
                                          // An example of the extended floating action button.
                                          //
                                          // https://m3.material.io/components/extended-fab/specs#686cb8af-87c9-48e8-a3e1-db9da6f6c69b
                                          FloatingActionButton.extended(
                                            onPressed: () {
                                              _decrementarCantidad();
                                            },
                                            label: const Text('Bajar Cantidad'),
                                            icon:
                                                const Icon(Icons.remove_sharp),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(
              36,
              0,
              36,
              10,
            ),
            child: ElevatedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                child: Text(
                  'Comprar',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
              onPressed: () {
                calculosDeCompra();
                //'$_counter'

                var producto = <String, dynamic>{
                  'alimento': controlAlimento.text,
                  'valoralimento': controlValorAlimento.text,
                  'estado': controlEstado.text,
                  'cantidadProducto': controlCantidadProducto.text,
                  'tipo': controlTipo.text,
                  'foto': controlFoto.text,
                };

                PeticionesProducto.actualizarProducto(
                    widget.perfil[widget.pos].id, producto);

                Navigator.of(context).pop();
              },
            ),
          ),
          //////////////////////////////////////////////////////////////////////////////
          ///
        ],
      ),
    );
  }

  calculosDeCompra() {
    var producto = controlAlimento.text;
    var cantidad = _counter;
    var valorProducto = controlValorAlimento;

    var compraTemp = <String, dynamic>{
      'producto': controlAlimento.text,
      'cantidad': _counter.toString(),
      'valorProducto': controlValorAlimento.text,
      'foto': controlFoto.text,
    };

    PeticionesCompraTemp.crearProducto(compraTemp);

    if (_counter == int.parse(controlCantidadProducto.text)) {
      controlEstado.text = "AGOTADO";
      controlCantidadProducto.text = "0";
    } else {
      controlCantidadProducto.text =
          (int.parse(controlCantidadProducto.text) - _counter).toString();
    }
  }
}
