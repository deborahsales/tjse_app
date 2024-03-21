import 'package:disp_moveis/authentication/components/show_senha_confirmacao_dialog.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final Future<String?> nome;

  const Perfil(this.nome, {super.key, required BuildContext context});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(children: [
          SizedBox(
            width: 400,
            height: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                  ),
                  Expanded(
                    child: FutureBuilder<String?>(
                        future: widget.nome,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final nomeString = snapshot.data!;
                            return Text(
                              nomeString,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            );
                          } else if (snapshot.hasError) {
                            return const Text(
                              "Usuário",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            );
                          }
                      return const Center(child: CircularProgressIndicator());
                    }),
                  ),
                  IconButton(
                      onPressed: () {
                        showSenhaConfirmacaoDialog(context: context, email: '');
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.black12),
            width: 100,
            height: 100,
            child: const Icon(Icons.person, color: Colors.white, size: 60),
          ),
        ]));
  }
}
