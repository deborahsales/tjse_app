import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../components/favorito.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
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
        Favorito(nome: "Joe Doe"),
        Favorito(cargo: "Juiz"),
        Favorito(
          salarioFinal: 1000,
          salarioInicial: 900,
        ),
        Favorito(
          mes: "Janeiro",
          ano: "2023"
        )
      ]),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
