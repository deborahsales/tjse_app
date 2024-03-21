import 'package:flutter/material.dart';
import '../authentication/services/auth_service.dart';
import '../components/barra_inferior.dart';
import '../components/barra_superior.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 238, 255, 1.0),
      appBar: const BarraSuperior(),
      body: ListView(children: [
        Perfil(AuthService().nomeUsuario(), context: context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    bool isInitialScreen(Route<dynamic> route) {
                      return route.isFirst || route.settings.name == '/initialScreen';
                    }

                    AuthService().deslogar();
                    Navigator.of(context).popUntil(isInitialScreen);
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
