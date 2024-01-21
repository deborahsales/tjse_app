import 'package:flutter/material.dart';

class MesAnoScreen extends StatefulWidget {
  const MesAnoScreen({super.key});

  @override
  State<MesAnoScreen> createState() => _MesAnoScreenState();
}

class _MesAnoScreenState extends State<MesAnoScreen> {
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
      body: ListView(children: const [Text('Busca por mês e ano')]),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          height: 70,
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
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
