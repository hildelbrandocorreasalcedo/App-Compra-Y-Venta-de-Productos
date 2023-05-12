import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/firestore.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDmnmK5Imdy6n7r6cQrL1hEfBzy8z7BBx4", // Your apiKey
      appId: "307c476f76aaaee2c97213", // Your appId
      messagingSenderId: "1049261848682", // Your messagingSenderId
      projectId: "appventapoductos", // Your projectId
    ),
  );
  Get.put(Peticiones2());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programacion Movil',
      theme: ThemeData.light(),
      home: Login(),
    );
  }
}
