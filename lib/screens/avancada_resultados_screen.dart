import 'package:flutter/material.dart';
import 'package:resultados_tjse/resultados_tjse.dart';
import '../components/barra_inferior.dart';
import '../data/tjse_dao.dart';

class ResultadoAvancadaScreen extends StatefulWidget {
  final String nome;
  final String cargo;
  final String lotacao;
  final String mes;
  final String ano;
  final String min;
  final String max;

  const ResultadoAvancadaScreen({
    Key? key,
    String? nome,
    String? cargo,
    String? lotacao,
    String? mes,
    String? ano,
    String? min,
    String? max,
  })  : nome = nome ?? '',
        cargo = cargo ?? '',
        lotacao = lotacao ?? '',
        mes = mes ?? '',
        ano = ano ?? '',
        min = min ?? '',
        max = max ?? '',
        super(key: key);

  @override
  State<ResultadoAvancadaScreen> createState() => _ResultadoAvancadaScreenState();
}

class _ResultadoAvancadaScreenState extends State<ResultadoAvancadaScreen> {

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
      body: FutureBuilder<List<Resultado>>(
        future: TJSEDao().getAvancada(widget.nome, widget.cargo, widget.lotacao, widget.ano, widget.mes, widget.min, widget.max),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Resultado>? items = snapshot.data;
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
                        final Resultado resultado = items[index];
                        return resultado;
                      });
                }
                return const Center(
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 128),
                      Text('Não há nenhum resultado',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 32))
                    ],
                  ),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Erro ao carregar resultados',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32)),
              );
          }
        },
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
