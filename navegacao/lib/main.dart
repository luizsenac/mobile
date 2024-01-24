// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//método principal que inicia a aplicação
void main() {
  runApp(Aplicativo()); //runApp - roda app - Chama classe Aplicativo
}

//A classe aplicativo vai herdar Stateless - não tem alteração dentro da tela
class Aplicativo extends StatelessWidget {
  //Widget build vai construir a aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //oferece padrão de design e compomentes
      home: Pagina1(), //home - representa tela inicial - a primeira que abre
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fornece estruturas básicas
    return Scaffold(
      //barra de cima
      appBar: AppBar(
        //texto dentro da barra - cor da letra
        title: const Text(
          'Página 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, //cor da barra
      ),
      //body- corpo - Center -Centralizar(direta-esquerda)
      body: Center(
        //organize em sentido coluna
        child: Column(
          //centraliza sentido(acima-abaixo)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Colocando imagem e personalizando tamanho
            Image.network(
              'https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png',
              width: 400,
              height: 400,
            ),
            const Text(
              'Bem-vindo a tela Inicial',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Flutter é uma ferramenta multiplataforma - Android e IOS com um único código',
            ),

            const SizedBox(height: 20), //dar uma quebra de linha <br>

            //botão
            ElevatedButton(
              onPressed: () {
                //Navigator, gerencia navegações entre telas
                //push - empurra uma nova rota, para a pilha de navegação
                Navigator.push(
                  //context identifica pagina atual
                  context,
                  //MaterialPageRouter-define animação e layout para ir para outra tela
                  //builder - Constroi a nova tela Pagina2
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              },
              child: Text(
                'Ir para Página 2',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        backgroundColor: Colors.green,
      ),

      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://m.media-amazon.com/images/I/51nn2rWyTVL.jpg',
              width: 400,
              height: 400,
            ),
            SizedBox(height: 20),
            Text(
              'Linguagem DART',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'É uma linguagem versátil que combina eficiência e desempenho, tornando-a uma escolha atraente para o desenvolvimento de aplicativos móveis e web, especialmente quando combinada com o Framework Flutter.',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina3()),
                );
              },
              child: Text('Ir para página 3'),
            ),
          ],
        ),
      ),
    );
  }
}

//Stateless - informações estatícas, não mudam
class Pagina3 extends StatelessWidget {
  //build - responsável pela renderização/construção
  @override
  Widget build(BuildContext context) {
    //define estruturas de layout - appbar + body
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 3'),
        backgroundColor: Colors.orangeAccent,

        //action permite adiconar icone a direita
        actions: [
          //exibe menu pop-up
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Opção 1'),
                  value: 'opcao1',
                ),
                PopupMenuItem(
                  child: Text('Opção 2'),
                  value: 'opcao2',
                ),
              ];
            },
            onSelected: (value) {}, //ação ao selecionar opção
          ),
        ],
      ),
      //corpo do aplicativo - Centralizando esquerda/direita
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //centralizando acima-baixo
          children: [
            Image.network(
              'https://i0.wp.com/assets.b9.com.br/wp-content/uploads/2012/08/023.jpg?fit=600%2C393&ssl=1',
              width: 300,
              height: 300,
            ),
            Text(
              'A História do Senac',
              style: TextStyle(fontSize: 30),
            ),
            Text(
                'O Senac foi criado no ano 1946, com o propósito de educar profissionalmente'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina1()),
                );
              },
              child: Text('Voltar para Página Inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
