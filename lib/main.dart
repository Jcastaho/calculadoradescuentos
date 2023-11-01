import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Descuentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Descuentos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  double _totalProducto = 0;
  double _totalDescuento = 0;
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();
  final _numero3 = TextEditingController();
  final _numero4 = TextEditingController();
  String aprueba = "";
  void _calcular() {
    setState(() {
      _totalDescuento = (double.parse(_numero1.text) * double.parse(_numero2.text)) / 100;
      _totalProducto = double.parse(_numero1.text)- _totalDescuento;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Calculadora de descuentos",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _numero1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese el valor del producto",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _numero2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "¿Cuanto descuento desea colocarle? ",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular();
                    },
                    child: Text("Calcular descuento"),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text('El descuento es de: $_totalDescuento y el producto quedaria en un valor de: $_totalProducto',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: Colors.indigo)),
                ],
              ))
            ]),
      ),
    );
  }
}
