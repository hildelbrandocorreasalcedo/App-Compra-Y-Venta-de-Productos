import 'package:best_parking_app_firebase/pages/Admin/inicioAdmin.dart';
import 'package:best_parking_app_firebase/peticiones/peticionesProducto.dart';
import 'package:flutter/material.dart';

//--------Producto

class AgregarProducto extends StatefulWidget {
  AgregarProducto({Key? key}) : super(key: key);

  @override
  State<AgregarProducto> createState() => _AgregarProductoState();
}

class _AgregarProductoState extends State<AgregarProducto> {
  TextEditingController controlTipo = TextEditingController();
  TextEditingController controlAlimento = TextEditingController();
  TextEditingController controlValorAlimento = TextEditingController();
  TextEditingController controlCantidadProducto = TextEditingController();
  TextEditingController controlFoto = TextEditingController();
  TextEditingController controlTotalPagar = TextEditingController();
  TextEditingController controlEstado = TextEditingController();

  String selectedValue1 = 'Tipo Alimento';
  String seleccionado_1 = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) =>
                      value == null ? "Select a country" : null,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                  value: selectedValue1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue1 = newValue!;
                      controlTipo.text = newValue;
                    });
                  },
                  items: <String>['Tipo Alimento', 'COMIDA', 'BEBIDA']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlAlimento,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields_sharp),
                      labelText: 'Alimento'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlValorAlimento,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields_sharp),
                      labelText: 'Valor Alimento'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlCantidadProducto,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields_sharp),
                      labelText: 'Cantidad de productos'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlFoto,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_fields_sharp),
                      labelText: 'Foto del producto'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                child: MaterialButton(
                  minWidth: 400.0,
                  height: 60.0,
                  onPressed: () {
                    if (selectedValue1.toString() != 'Tipo Alimento' &&
                        controlTipo.text.isNotEmpty) {
                      var producto = <String, dynamic>{
                        'tipo': selectedValue1.toString(),
                        'alimento': controlAlimento.text,
                        'valoralimento': controlValorAlimento.text,
                        'cantidadProducto': controlCantidadProducto.text,
                        'foto': controlFoto.text,
                        'estado': controlEstado.text = "DISPONIBLE",
                        'totalpagar': controlTotalPagar == 0,
                      };

                      PeticionesProducto.crearProducto(producto);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  inicioAdmin()));
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('Agregado correctamente'),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('No se aceptan campos vacios'),
                              ));
                    }
                  },
                  color: Colors.lightBlue,
                  child: Text('Registrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Prompt')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }
}
