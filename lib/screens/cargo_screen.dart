import 'package:flutter/material.dart';
import 'package:resultados_tjse/resultados_tjse.dart';
import '../components/barra_inferior.dart';
import '../components/barra_superior.dart';
import '../data/tjse_dao.dart';

class CargoScreen extends StatefulWidget {
  const CargoScreen({super.key});

  @override
  State<CargoScreen> createState() => _CargoScreenState();
}

class _CargoScreenState extends State<CargoScreen> {
  String? dropdownValue;
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
      appBar: const BarraSuperior(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                height: 60,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 8),
                  child: DropdownButton(
                      value: dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 40,
                      isExpanded: true,
                      hint: const Text("Busca por cargo..."),
                      underline: Container(),
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      items: TJSEDao.cargoList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? selectedValue) {
                        setState(() { dropdownValue = selectedValue;_atualizarBusca();{}});
                      }),
                ),
              ),
            ),
            Expanded(
              child: _buscar ? FutureBuilder<List<Resultado>>(
                future: TJSEDao().getCargo(dropdownValue!),
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
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Erro ao carregar resultados',
                            style: TextStyle(fontSize: 32)),
                      );
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
