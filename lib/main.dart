import 'package:flutter/material.dart';
import 'package:pesquisa_cafe_02/providers/buscar_praga_provider.dart';
import 'package:pesquisa_cafe_02/screens/burcarDoenca/buscar_praga.dart';
import 'package:pesquisa_cafe_02/screens/home/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BuscarPragraProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your applicatio.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/home',
            routes: {
              '/home': (BuildContext context) => HomePage(),
              '/findProduto': (BuildContext context) => BuscarProduto(),
            },
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
