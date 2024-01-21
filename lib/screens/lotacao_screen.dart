import 'package:flutter/material.dart';

const List<String> list = <String>['Aracaju', 'Lagarto', 'Itabaiana'];

class LotacaoScreen extends StatefulWidget {
  const LotacaoScreen({super.key});

  @override
  State<LotacaoScreen> createState() => _LotacaoScreenState();
}

class _LotacaoScreenState extends State<LotacaoScreen> {
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
                    hint: const Text("Busca por lotação..."),
                    underline: Container(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    items: list.map((String value) {
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
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
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
