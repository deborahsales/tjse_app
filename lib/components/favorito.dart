import 'package:flutter/material.dart';

class Favorito extends StatelessWidget {
  String? nome;
  String? cargo;
  String? lotacao;
  String? mes;
  String? ano;
  double? salarioInicial;
  double? salarioFinal;

  Favorito(
      {this.nome,
      this.cargo,
      this.lotacao,
      this.mes,
      this.ano,
      this.salarioInicial,
      this.salarioFinal,
      super.key});

  bool stringValidator(String? value) {
    if (value != null) {
      return true;
    }
    return false;
  }

  bool doubleValidator(double? value) {
    if (value != null) {
      return true;
    }
    return false;
  }

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
                    child: Text(
                      stringValidator(nome)
                          ? "Nome: " + nome!
                          : stringValidator(cargo)
                              ? "Cargo: " + cargo!
                              : stringValidator(lotacao)
                                  ? "Lotação: " + lotacao!
                                  : stringValidator(mes) &&
                                          stringValidator(ano)
                                      ? "Mês: " + mes! + "\nAno: " + ano!
                                      : doubleValidator(
                                                  salarioInicial) &&
                                              doubleValidator(
                                                  salarioFinal)
                                          ? "R\$" + salarioInicial!.toString() + " - R\$" +
                                              salarioFinal!.toString()
                                          : "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.black12),
            width: 100,
            height: 100,
            child: const Icon(Icons.favorite,color: Colors.white, size: 60),
          ),
        ]));
  }
}
