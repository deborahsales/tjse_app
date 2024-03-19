import 'package:flutter/material.dart';
import 'package:resultados_tjse/resultados_tjse.dart';
import '../components/barra_inferior.dart';
import '../data/tjse_dao.dart';

class MesAnoScreen extends StatefulWidget {
  const MesAnoScreen({super.key});

  @override
  State<MesAnoScreen> createState() => _MesAnoScreenState();
}

class _MesAnoScreenState extends State<MesAnoScreen> {
  String? anoDropdownValue;
  String? mesDropdownValue;
  bool _buscar = false;

  void _atualizarBusca()
  {
    setState(() {
      _buscar = true;
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    height: 60,
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 8),
                      child: DropdownButton(
                          value: mesDropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 40,
                          isExpanded: true,
                          hint: const Text("Mês..."),
                          underline: Container(),
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          items: TJSEDao.mesList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? selectedValue) {
                            setState(() { mesDropdownValue = selectedValue; (mesDropdownValue != null && anoDropdownValue != null) ? _atualizarBusca() : () {}; { } });
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    height: 60,
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 8),
                      child: DropdownButton(
                          value: anoDropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 40,
                          isExpanded: true,
                          hint: const Text("Ano..."),
                          underline: Container(),
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          items: TJSEDao.anoList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? selectedValue) {
                            setState(() { anoDropdownValue = selectedValue; (mesDropdownValue != null && anoDropdownValue != null) ? _atualizarBusca() : () {}; { } });
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: _buscar ? FutureBuilder<List<Resultado>>(
                future: TJSEDao().getMesAno(mesDropdownValue ?? '', anoDropdownValue ?? ''),
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
                                  style: TextStyle(fontSize: 32))
                            ],
                          ),
                        );
                      }
                      return const Text('Erro ao carregar resultados');
                  }
                },
              ) : const SizedBox(),)
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
