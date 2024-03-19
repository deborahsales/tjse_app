import 'package:resultados_tjse/resultados_tjse.dart';
import 'database.dart';

class TJSEDao {
  Future<List<Resultado>> getNome(String nome) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result = await database.queryByNome(nome);
    return toList(result);
  }

  Future<List<Resultado>> getCargo(String cargo) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result =
        await database.queryByCargo(cargo);
    return toList(result);
  }

  Future<List<Resultado>> getLotacao(String lotacao) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result =
        await database.queryByLotacao(lotacao);
    return toList(result);
  }

  Future<List<Resultado>> getMesAno(String mes, String ano) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result =
        await database.queryByMesAno(mes, ano);
    return toList(result);
  }

  Future<List<Resultado>> getFaixaSalarial(String min, String max) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result =
        await database.queryByFaixaSalarial(min, max);
    return toList(result);
  }

  Future<List<Resultado>> getAvancada(String nome, String cargo, String lotacao,
      String ano, String mes, String min, String max) async {
    final database = PostgresDatabase();
    await database.initialize();
    final List<Map<String, dynamic>> result = await database
        .queryByAvancada(nome, cargo, lotacao, ano, mes, min, max);
    return toList(result);
  }

  List<Resultado> toList(List<Map<String, dynamic>> mapaResultados) {
    final List<Resultado> resultados = [];
    for (Map<String, dynamic> linha in mapaResultados) {
      String cargo = linha['cargo'];
      String lotacao = linha['lotacao'];
      String rendLiquido = linha['rend_liquido'];
      String totalCreditos = linha['total_creditos'];
      String totalDebitos = linha['total_debitos'];
      String mes = linha['mes'].toUpperCase();
      String ano = linha['ano'].toString();
      String tituloUm = linha['nome'];
      String tituloDois = '$mes $ano';
      String dados = 'Cargo: $cargo\nLotacao: $lotacao\nR\$$rendLiquido';
      String dadosExpandidos =
          'Total créditos: $totalCreditos\nTotal débitos: $totalDebitos';
      final Resultado resultado =
          Resultado(tituloUm, tituloDois, dados, dadosExpandidos);
      resultados.add(resultado);
    }
    return resultados;
  }

  static const List<String> cargoList = <String>[
    '',
    '1º Sargento',
    '1º Tenente',
    '2º Sargento',
    '2º Tenente',
    '3º Sargento',
    'Agente de Policia Penal',
    'Agente de Serviços Judiciários',
    'Analista Judiciário',
    'Auxiliar de Cartório',
    'Avaliador da Capital',
    'Cabo',
    'Capitão',
    'Cargo em comissão',
    'Contador',
    'Desembargador',
    'Escrivão',
    'Estagiário',
    'Exonerado',
    'Guarda',
    'Juiz de Direito de Entrância Final',
    'Juiz de Direito de Entrância Inicial',
    'Juiz Substituto',
    'Militar',
    'Oficial de Justiça',
    'Pensionista da folha',
    'Requisitado',
    'Soldado',
    'Subtenente',
    'Tabelião',
    'Técnico Judiciário'
  ];

  static const List<String> lotacaoList = <String>[
    '',
    'A Disposição',
    'Administração',
    'Aposentados do Poder Judiciário',
    'Assessoria Especial da Presidência',
    'Assessoria Extrajudicial',
    'Assessoria Jurídica',
    'Biblioteca Central',
    'Biblioteca Setorial',
    'Cartório',
    'Centro Médico',
    'Comarca da Barra dos Coqueiros',
    'Comarca de Aracaju',
    'Comarca de Estância',
    'Comarca de Itabaiana',
    'Comarca de Itaporanga DAjuda',
    'Comarca de Lagarto',
    'Comarca de Laranjeiras',
    'Comarca de Neópolis',
    'Comarca de Nossa Senhora da Glória',
    'Comarca de Nossa Senhora das Dores',
    'Comarca de Nossa Senhora do Socorro',
    'Comarca de Propriá',
    'Comarca de São Cristívão',
    'Comarca de Simão Dias',
    'Comarca de Tobias Barreto',
    'Consultoria',
    'Coordenadoria',
    'Corregedoria Geral da Justiça',
    'Diretoria',
    'Entrância Final'
  ];

  static const List<String> mesList = <String>[
    '',
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  static const List<String> anoList = <String>[
    '',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
  ];
}
