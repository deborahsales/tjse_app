import 'package:disp_moveis/exemplos/exemplo_mes_ano_screen.dart';
import 'package:flutter/material.dart';
import 'package:disp_moveis/screens/favoritos_screen.dart';
import 'package:disp_moveis/screens/perfil_screen.dart';
import 'package:disp_moveis/screens/notificacoes_screen.dart';

import '../data/tjse_dao.dart';

class MesAnoScreen extends StatefulWidget {
  const MesAnoScreen({super.key});

  @override
  State<MesAnoScreen> createState() => _MesAnoScreenState();
}

class _MesAnoScreenState extends State<MesAnoScreen> {
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
                              {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ExemploMesAnoScreen(),
                                  ),
                                );
                              }
                            });
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: ListView(children: []))
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
