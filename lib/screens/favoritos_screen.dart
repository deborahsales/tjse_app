import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../components/barra_superior.dart';

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
      appBar: const BarraSuperior(),
      body: ListView(children: const []),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
