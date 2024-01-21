import 'package:disp_moveis/components/resultado.dart';
import 'package:flutter/material.dart';
import 'package:disp_moveis/screens/favoritos_screen.dart';
import 'package:disp_moveis/screens/perfil_screen.dart';
import 'package:disp_moveis/screens/notificacoes_screen.dart';
import '../data/tjse_dao.dart';

class ExemploAvanScreen extends StatefulWidget {
  const ExemploAvanScreen({super.key});

  @override
  State<ExemploAvanScreen> createState() => _ExemploAvanScreenState();
}

class _ExemploAvanScreenState extends State<ExemploAvanScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController faixaInicialController = TextEditingController();
  TextEditingController faixaFinalController = TextEditingController();
  String? cargoDropdownValue;
  String? lotacaoDropdownValue;
  String? anoDropdownValue;
  String? mesDropdownValue;

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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: nameController,
                      style: const TextStyle(fontSize: 20),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nome...",
                      ),
                    ),
                  )),
            ),
            Row(
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
                          value: cargoDropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 40,
                          isExpanded: true,
                          hint: const Text("Cargo..."),
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
                              cargoDropdownValue = selectedValue;
                            });
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
                          value: lotacaoDropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 40,
                          isExpanded: true,
                          hint: const Text("Lotação..."),
                          underline: Container(),
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          items: TJSEDao.lotacaoList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? selectedValue) {
                            setState(() {
                              lotacaoDropdownValue = selectedValue;
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
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
                            setState(() {
                              mesDropdownValue = selectedValue;
                            });
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
                            setState(() {
                              anoDropdownValue = selectedValue;
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, size: 40),
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView(children: const [
                  Resultado(
                      'Janeiro',
                      '2023',
                      'Servidor XXX\nLotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                      "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
                  Resultado(
                      'Janeiro',
                      '2023',
                      'Servidor XXX\nLotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                      "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
                  Resultado(
                      'Janeiro',
                      '2023',
                      'Servidor XXX\nLotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                      "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
                  Resultado(
                      'Janeiro',
                      '2023',
                      'Servidor XXX\nLotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                      "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX"),
                  Resultado(
                      'Janeiro',
                      '2023',
                      'Servidor XXX\nLotação XXX\nCargo XXX\nR\$ XX.XXXX,XX',
                      "XXXXXX\nXXXXXX\nXXXXXX\nXXXXXX")
                ]))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          height: 70,
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritosScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificacoesScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 40,
              ),
            ),
          ])),
    );
  }
}
