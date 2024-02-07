import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;
  double posicao = 0;

  void movimentar() {
    setState(() {
      if (contador1 > contador2) {
        posicao = 50.0;
      } else if (contador2 > contador1) {
        posicao = MediaQuery.of(context).size.width - 150.0;
      } else {
        posicao = MediaQuery.of(context).size.width / 2 - 50;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_tempo > 0) {
          _tempo--;
        } else {
          _timer.cancel();
          _clique = false;
        }
      });
    });
  }

  void mudarCor() {
    if (contador1 > contador2) {
      cor1 = Colors.red;
      cor2 = Colors.black;
    } else if (contador2 > contador1) {
      cor1 = Colors.black;
      cor2 = Colors.red;
    } else {
      cor1 = Colors.blue;
      cor2 = Colors.blue;
    }
  }

  void _reiniciar() {
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
      _clique = true;
    });
    _timer.cancel();
    _iniciarTimer();
  }

  @override
  Widget build(BuildContext context) {
    mudarCor();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Jogo Contador',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contador 1: $contador1',
                    style: TextStyle(fontSize: 30, color: cor1),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contador 2: $contador2',
                    style: TextStyle(fontSize: 30, color: cor2),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tempo restante: $_tempo segundos',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: 200.0,
              left: posicao,
              curve: Curves.elasticOut,
              child: Image.network(
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOsAAADWCAMAAAAHMIWUAAAAw1BMVEX39/cZFRdiTUnMg2PwybK5ublKOTZnIz4pMTUeJSi9Qjzn5+f09PS8vLzu7u4mIiRBPkAdGRsoGB5BMjDOhmeysrKpp6iSkZKrcFdoT0q4QTw8MzbpxK26nItVQ0B6VEcoJSuKiInGxcVRTk9YVVfPzs47Mi8bGx25eFxqRznSjm9BLig8GykkKi00KiotJCVraWrJqpaliXqAbGJ0KD6faE9ZIDfd3N1FQkSQjo9tTUNTPzpGNzR5V0uEXk7Usp43GiafmchLAAADv0lEQVR4nO3dWVfaQBiAYRGpC2GJC1ilWLS0aKtoN2jt9v9/VS/yzSRmMiSRZQZ83zs9A+Q5cGQyDHFri4iIiIiIiIiIiIiIiCivIC5/1MqOaikF3YHOTqnLiMkKj2zxNduhzm4dyojGCo9s8TXbFd0Mq4zAui5hTYfVQUEzKkj9XKh64u9w3Tpq2Ipybm3IgQyjH4Nuq0z9bZ190LQe5Xwy0ZAXmLaGlRIlrPZBbbfCOKxYsWLF6jasG2qVKd4wWidp/ihjDRNW++28sarFIDWLH78y2n5WoYdWCStWrFixumnSjTofRx0tynp0p5rKQzhf91fzpgzjfNa4vjyE+/UmrFixYsWKFSvW5Vofdf182Jpb532KsWLFihUr1jzrzwujfqpiVlmLGXSiLl1tEplhPa2mG831PI/loe6xYsWKFSvWfOtjqtf2TOud7MVcD2uJRqFRLbV9d2OsVXOviM9zRKxYsWLFinUp1l/RQsPjbOtxbmrkKLaG3nw/Rw7ooRf12bTGM5+j3k5eb9TY+Plsu54vGVY51gxrfNTvC1iNl64/+5uwYsWKFavblPX0Jup4pKturNU+28OKFasnYd1Qq5yCzbDG53RFrMYpnT/WiVxc6bfsEvhmWq91f/Ktf79IHn5nRV1WS10B5Nr+/FarN7nUnR055+95aFXJd5HmtyoyVi/CihUrVqxue0nW4WXU4KPOnCIfy0LNDPODLFb1L3VD1zZLyWukZEyNVXarOs9pNV1TcsOKFStWrwrM6zfNsPasqTUYn61qLvFpV3dYeUZXa3BxcHWNlLmtriEFwooVK1Yfw4p1Xa31YdT5YVTC+u+wTGKdyv0NPZw5qc8kv+/OmVhDj+fD6rPmRVlVWN2GFSvWF2zV7zmF/sXZSkvvb7qI15tM/tezA1tncqO+rLH1Wnqn0NS1UbUo60Ha6uFnV1ixYsW6AVZ7yurxfkRlHav0IVbemp3bkxuF6irhHlsz2jfbs2e/H6wOwooVK1asbmuEqWZZbwtYzWtUeXOuPuk87d60ftDtdU6iWuoXhrXdMaq5NuqCpyX2/Chr4tWoFpHUoFvDehWYuSZaSu7lyrLKqBlWt8dfJqxYsbo9/jK9VKu8h+6/06mrc8bWOBkycHv8Zcr4/6+h+f4YGIMqFV/fRe1hNUZhXbOwGqOw+lXGCVeqbssoY5Q5KLlnIK+VUOuN3GonRhmjzEEntfz7llbzvcl6zYewYsWKFavbsGKdw1p4brPMVmMN6j7k4c5iIiIiIiIiIiJ6Sf0Hk4d8o2ixf3MAAAAASUVORK5CYII=',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                      contador1++;
                      movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar Contador 1',
                child: Icon(Icons.add),
              ),
            ),
            FloatingActionButton(
              onPressed: _reiniciar,
              tooltip: 'Zerar Contagem',
              child: Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.00),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                      contador2++;
                      movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar contador 2',
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
