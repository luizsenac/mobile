// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//onde a execução do programa começa - principal
void main() {
  runApp(const Aplicativo()); //roda aplicativo
}

//classe aplicativo(contém caracteristicas,variaveis e funções)
//extends - extende- Herda caracteristicas do widget stateless
//stateless - toda interface é imutavel após a criação
class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key}); //classe pai

  //build - método que recostroi tela
  @override
  Widget build(BuildContext context) {
    //widget responsável pelo design da aplicação, fornece temas e recursos

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home - tela principal - Scaffold fornece layout basico
      home: Scaffold(
        appBar: AppBar(
          //---------- appbar é a barra superior
          backgroundColor: Colors.green, //cor de fundo da barra
          title: const Text(
            //colocar titulo - Texto na barra
            'Flutter é divertido!', //o texto que você quer entre aspas
            style: TextStyle(color: Colors.white), //alterar a cor do texto
          ),
        ),
        // ------ body é o corpo do app, Center vai centralizar o conteúdo
        body: const Center(
          //child representa que é filho do widget Center -SizedBox - CaixaComTamanho

          child: SizedBox(
            // ignore: unnecessary_const, sort_child_properties_last
            child: const Text(
              'Flutter foi criado pelo Google, usa a linguagem DART',
              style: TextStyle(
                //estilo do texto
                fontSize: 20, //tamanho do texto
                fontFamily: 'arial', //qual fonte usar
              ),
            ),
            height: 300, //altura da caixa
            width: 300, //largura da caixa
          ),
        ),

        //------- botão flutuante no canto direito abaixo
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green, //alterar cor botão
          child: Icon(Icons.add), //icone do botão
          onPressed: () {}, //ação quando clicar
        ),

        //------ barra de navegação inferior
        //BottomNavigationBarItem - é o item da barra de navegação
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Negócios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
        ]),

        //---- barra lateral do aplicativo
        drawer: Drawer(
          backgroundColor: Colors.white,

          //lista dos itens do menu
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Menu App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                //item do menu
                leading: const Icon(Icons.home), //icone do item do menu
                title: const Text('Pagina Inicial'), //titulo do item do menu
                onTap: () {}, //ação que o botão irá executar
              ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('configurações'),
                  onTap: () {}),
              ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Perfil'),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
