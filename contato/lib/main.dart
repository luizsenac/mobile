import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  //necessário para inicializar a widget, passa a classe pai
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const Principal(title: 'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget {
  //passa parâmetros informações para dentro dessa classe
  const Principal({super.key, required this.title});
  final String title;

  //cria um estado que vai se referir a classe _PrincipalEstado
  @override
  State<Principal> createState() => _PrincipalEstado();
}

//Classe _PrincipalEstado herdando o Estado - Estado: vai ficar atualizando
class _PrincipalEstado extends State<Principal> {
  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
        "https://iphoneswallpapers.com/wp-content/uploads/2023/10/The-iron-man-chronicles-iPhone-Wallpaper-4K.jpg"),
    radius: 150,
  );

  final nome = const Text(
    'Luiz Gustavo',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final obs = const Text(
    'Programador Full Stack Senac',
    style: TextStyle(fontSize: 20, color: Colors.blue),
    textAlign: TextAlign.center,
  );

  final email = IconButton(
    icon: const Icon(Icons.mail),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(
        scheme: 'mailto',
        path: 'luiz.francisco@docente.pr.senac.br',
        queryParameters: {
          'subject': 'Assunto do email',
          'body': 'Corpo do Email',
        },
      ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+5544974009708'));
    },
  );

  final sms = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.sms),
    onPressed: () {
      launchUrl(Uri(scheme: 'sms', path: '+5544974009708'));
    },
  );

  final site = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.open_in_browser),
    onPressed: () {
      launchUrl(Uri.parse(
          'https://www.linkedin.com/in/luiz-gustavo-francisco-7ba970186/'));
    },
  );

  final whatsapp = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.wechat),
    onPressed: () {
      launchUrl(Uri.parse('https://api.whatsapp/+554497009708'));
    },
  );

  final mapa = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.map),
    onPressed: () {
      launchUrl(Uri.parse('https://maps.app.goo.gl/ALo7WacLyQ28ugY37'));
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicativo de Contato',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {},
        ),
      ),
      //organizar em coluna
      body: Column(
        //alinhar conteúdo no centro - acima/baixo
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto, nome, obs,
          //criando linha
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email,
              telefone,
              sms,
              site,
              whatsapp,
              mapa,
            ],
            //botões do aplicativo
          ),
        ],
      ),
    );
  }
}
