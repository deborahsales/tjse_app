import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final String nome;

  const Perfil(this.nome, {super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(children: [
          SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: Text(
                      widget.nome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.black12),
            width: 100,
            height: 100,
            child: const Icon(Icons.person, color: Colors.white, size: 60),
          ),
        ]));
  }
}
