import 'package:disp_moveis/components/notificacoes.dart';
import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../components/barra_superior.dart';
import '../data/tjse_dao.dart';

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
      appBar: const BarraSuperior(),
      body: FutureBuilder<List<Notificacoes>>(
        future: TJSEDao().getNotificacao(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Notificacoes>? items = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                  child: Column(
                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text('Carregando',
                          style: TextStyle(fontSize: 20)),
                    )],
                  ));
            case ConnectionState.waiting:
              return const Center(
                  child: Column(
                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text('Carregando',
                          style: TextStyle(fontSize: 20)),
                    )],
                  ));
            case ConnectionState.active:
              return const Center(
                  child: Column(
                    children: [SizedBox(height: 40,), CircularProgressIndicator(), Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text('Carregando',
                          style: TextStyle(fontSize: 20)),
                    )],
                  ));
            case ConnectionState.done:
              if (snapshot.hasData && items != null) {
                if (items.isNotEmpty) {
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Notificacoes notificacoes = items[index];
                        return notificacoes;
                      });
                }
                return const Center(
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 110),
                      Text('Não há nenhuma notificação',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28))
                    ],
                  ),
                );
              }
              return const Center(
                child: Column(
                  children: [
                    Icon(Icons.report_gmailerrorred, size: 110),
                    Text('Erro ao carregar notificações',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28)),
                  ],
                ),
              );
          }
        },
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
