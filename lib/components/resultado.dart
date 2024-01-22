import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String tituloUm;
  final String tituloDois;
  final String dados;
  final String dadosExpandidos;

  Resultado(this.tituloUm, this.tituloDois, this.dados, this.dadosExpandidos,
      {super.key});

  bool expandedValidator = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 400,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$tituloUm $tituloDois",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white),
                  )
                ]),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: ExpansionTile(
              expandedAlignment: Alignment.center,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dados,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              children: <Widget>[
                Text(dadosExpandidos,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
