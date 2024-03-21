import 'package:flutter/material.dart';
import 'constantes.dart';

class BarraSuperior extends StatelessWidget implements PreferredSizeWidget{
  const BarraSuperior({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'TJSE - Folhas de Pagamento',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: myBlue,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}



