import 'package:disp_moveis/components/notificacoes.dart';
import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';

class NotificacoesScreen extends StatefulWidget {
  const NotificacoesScreen({super.key});

  @override
  State<NotificacoesScreen> createState() => _NotificacoesScreenState();
}

class _NotificacoesScreenState extends State<NotificacoesScreen> {
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
      body: ListView(children: const [
        Notificacoes("A folha de dezembro já está disponível!"),
        Notificacoes("A folha de novembro já está disponível!"),
        Notificacoes("A folha de outrubro já está disponível!")
      ]),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
