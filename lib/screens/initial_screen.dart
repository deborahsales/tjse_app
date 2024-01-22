import 'package:disp_moveis/components/barra_inferior.dart';
import 'package:disp_moveis/components/busca.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 238, 255, 1.0),
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'TJSE - Folhas de Pagamento',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: const [
        Busca('Busca por nome do servidor', 'assets/images/nome.png',1),
        Busca('Busca por cargo', 'assets/images/cargo.png',2),
        Busca('Busca por lotação', 'assets/images/lotacao.png',3),
        Busca('Busca por mês e ano', 'assets/images/mes_ano.png',4),
        Busca('Busca por faixa salarial', 'assets/images/faixa_salarial.png',5),
        Busca('Busca avançada', 'assets/images/avancada.png',6),
      ]),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
