import 'package:disp_moveis/exemplos/exemplo_cargo_screen.dart';
import 'package:flutter/material.dart';
import '../components/barra_inferior.dart';
import '../data/tjse_dao.dart';

class CargoScreen extends StatefulWidget {
  const CargoScreen({super.key});

  @override
  State<CargoScreen> createState() => _CargoScreenState();
}

class _CargoScreenState extends State<CargoScreen> {
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
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExemploCargoScreen(),
                            ),
                          );
                        }
                      });
                    }),
              ),
            ),
            Expanded(child: ListView(children: []))
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(),
    );
  }
}
