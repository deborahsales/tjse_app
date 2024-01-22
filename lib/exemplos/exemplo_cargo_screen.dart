import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../components/resultado.dart';
import '../data/tjse_dao.dart';

class ExemploCargoScreen extends StatefulWidget {
  const ExemploCargoScreen({super.key});

  @override
  State<ExemploCargoScreen> createState() => _ExemploCargoScreenState();
}

class _ExemploCargoScreenState extends State<ExemploCargoScreen> {
  String? dropdownValue;

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
            Container(
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
                      setState(() {
                        dropdownValue = selectedValue;
                      });
                    }),
              ),
            ),
            Expanded(child: ListView(children: [
              Resultado(
                  'Janeiro',
                  '2023',
                  'Servidor XXX\nLotação XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Janeiro',
                  '2023',
                  'Servidor XXX\nLotação XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Janeiro',
                  '2023',
                  'Servidor XXX\nLotação XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Janeiro',
                  '2023',
                  'Servidor XXX\nLotação XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
              Resultado(
                  'Janeiro',
                  '2023',
                  'Servidor XXX\nLotação XXX\nR\$ XX.XXXX,XX',
                  "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX")]))
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
