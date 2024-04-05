import 'package:flutter/material.dart';
import 'package:multiutilidades_app/Tela1.dart';

void main() {
  runApp(Aplicativo());
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiutilidades App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Menu(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/tela1': (context) => Tela1(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Principal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            botao(texto: 'Tela 1', rota: '/tela1', icone: Icons.home),
          ],
        ),
      ),
    );
  }
}

class botao extends StatelessWidget {
  final String texto;
  final String rota;
  final IconData icone;
  const botao(
      {Key? key, required this.texto, required this.rota, required this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () {
          Navigator.pushNamed(context, rota);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: Colors.indigo, size: 70),
            SizedBox(height: 8),
            Text(
              texto,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
