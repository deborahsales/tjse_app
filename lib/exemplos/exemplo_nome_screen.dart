import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../components/resultado.dart';

class ExemploNomeScreen extends StatefulWidget {
  const ExemploNomeScreen({super.key});

  @override
  State<ExemploNomeScreen> createState() => _ExemploNomeScreenState();
}

class _ExemploNomeScreenState extends State<ExemploNomeScreen> {
  TextEditingController nameController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 380,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: nameController,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Busca por nome...",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, size: 40),
                          color: Colors.black,
                        )
                      ])),
            ),
            Expanded(
                child: ListView(children: [
              Resultado(
                  'Janeiro',
                  '2023',
                  'Lotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Fevereiro',
                  '2023',
                  'Lotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Março',
                  '2023',
                  'Lotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Abril',
                  '2023',
                  'Lotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Maio',
                  '2023',
                  'Lotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX")
            ]))
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
