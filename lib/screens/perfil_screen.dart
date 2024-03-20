import 'package:flutter/material.dart';
import '../authentication/services/auth_service.dart';
import '../components/barra_inferior.dart';
import '../components/perfil.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final tjseUri =
      Uri.parse('https://www.tjse.jus.br/transparencia-publico/inicio');
  final String nome = AuthService().nomeUsuario() as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 238, 255, 1.0),
      appBar: AppBar(
        title: const Text(
          'TJSE - Folhas de Pagamento',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(children: [
        Perfil(nome),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    AuthService().deslogar();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: const SizedBox(
                    height: 50,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sair",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )),
            ),
            TextButton(
                onPressed: () async {
                  if (await canLaunchUrl(tjseUri)) {
                    await launchUrl(tjseUri,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Acesse aqui o site do TJSE',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(Icons.open_in_new, color: Colors.black),
                    )
                  ],
                ))
          ],
        )
      ]),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
