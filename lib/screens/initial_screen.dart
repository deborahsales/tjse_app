import 'package:disp_moveis/components/search.dart';
import 'package:disp_moveis/screens/favoritos_screen.dart';
import 'package:disp_moveis/screens/perfil_screen.dart';
import 'package:disp_moveis/screens/notificacoes_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 238, 255, 1.0),
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'TJSE - Folhas de Pagamento',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: [
        Search('Busca por nome do servidor', 'assets/images/nome.png',1),
        Search('Busca por cargo', 'assets/images/cargo.png',2),
        Search('Busca por lotação', 'assets/images/lotacao.png',3),
        Search('Busca por mês e ano', 'assets/images/mes_ano.png',4),
        Search('Busca por faixa salarial', 'assets/images/faixa_salarial.png',5),
        Search('Busca avançada', 'assets/images/avancada.png',6),
      ]),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritosScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificacoesScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 40,
              ),
            ),
          ])),
    );
  }
}
