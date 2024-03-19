import 'package:flutter/material.dart';
import 'package:resultados_tjse/resultados_tjse.dart';
import '../components/barra_inferior.dart';
import '../data/tjse_dao.dart';

class NomeScreen extends StatefulWidget {
  const NomeScreen({super.key});

  @override
  State<NomeScreen> createState() => _NomeScreenState();
}

class _NomeScreenState extends State<NomeScreen> {
  TextEditingController nameController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 380,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: nameController,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Busca por nome...",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _atualizarBusca,
                          icon: const Icon(Icons.search, size: 40),
                          color: Colors.black,
                        )
                      ])),
            ),
            Expanded(
                child: _buscar ? FutureBuilder<List<Resultado>>(
              future: TJSEDao().getNome(nameController.text),
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
