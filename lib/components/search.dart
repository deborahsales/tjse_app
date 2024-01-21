import 'package:flutter/material.dart';

import '../screens/avancada_screen.dart';
import '../screens/cargo_screen.dart';
import '../screens/faixa_salarial_screen.dart';
import '../screens/lotacao_screen.dart';
import '../screens/mes_ano_screen.dart';
import '../screens/nome_screen.dart';

class Search extends StatefulWidget {
  final String nome;
  final String icone;
  final int rota;

  const Search(this.nome, this.icone, this.rota, {super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(children: [
          SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                switch (widget.rota) {
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NomeScreen(),
                      ),
                    );
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CargoScreen(),
                      ),
                    );
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LotacaoScreen(),
                      ),
                    );
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MesAnoScreen(),
                      ),
                    );
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FaixaSalarialScreen(),
                      ),
                    );
                  case 6:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvanScreen(),
                      ),
                    );
                }
              },
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
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black12),
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(widget.icone, fit: BoxFit.scaleDown))),
        ]));
  }
}
