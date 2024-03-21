import 'package:flutter/material.dart';
import 'package:disp_moveis/screens/favoritos_screen.dart';
import 'package:disp_moveis/screens/perfil_screen.dart';
import 'package:disp_moveis/screens/notificacoes_screen.dart';

class BarraInferior extends StatelessWidget {
  const BarraInferior({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.blue,
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
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
        ]));
  }
}
