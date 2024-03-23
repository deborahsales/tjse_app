import 'package:disp_moveis/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

showSenhaConfirmacaoDialog({
  required BuildContext context,
}) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController senhaConfirmacaoController =
            TextEditingController();
        return AlertDialog(
          title: const Text("Deseja excluir a sua conta?"),
          content: SizedBox(
            height: 175,
            child: Column(
              children: [
                const Text(
                    "Para confirmar a remoção da conta, insira sua senha:"),
                TextFormField(
                    controller: senhaConfirmacaoController,
                    obscureText: true,
                    decoration: const InputDecoration(label: Text("Senha")))
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                AuthService()
                    .removerConta(senha: senhaConfirmacaoController.text)
                    .then((String? erro) {
                  if (erro == null) {
                    bool isInitialScreen(Route<dynamic> route) {
                      return route.isFirst ||
                          route.settings.name == '/initialScreen';
                    }

                    Navigator.of(context).popUntil(isInitialScreen);
                  }
                });
              },
              child: const Text("EXCLUIR CONTA"),
            )
          ],
        );
      });
}
