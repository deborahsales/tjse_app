import 'package:disp_moveis/exemplos/exemplo_faixa_salarial_screen.dart';
import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';

class FaixaSalarialScreen extends StatefulWidget {
  const FaixaSalarialScreen({super.key});

  @override
  State<FaixaSalarialScreen> createState() => _FaixaSalarialScreenState();
}

class _FaixaSalarialScreenState extends State<FaixaSalarialScreen> {
  TextEditingController faixaInicialController = TextEditingController();
  TextEditingController faixaFinalController = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      height: 60,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: faixaInicialController,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Min...",
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      height: 60,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: faixaFinalController,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Max...",
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExemploFaixaSalarialScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search, size: 40),
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView(children: []))
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
