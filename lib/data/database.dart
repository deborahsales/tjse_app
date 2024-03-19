import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:postgres/postgres.dart';

class PostgresDatabase {
  late final Connection connection;

  Future<void> initialize() async {
    await dotenv.load(fileName: '.env');

    final host = dotenv.env['DB_HOST']!;
    final database = dotenv.env['DB_DATABASE']!;
    final username = dotenv.env['DB_USERNAME']!;
    final password = dotenv.env['DB_PASSWORD']!;

    connection = await Connection.open(Endpoint(
      host: host,
      database: database,
      username: username,
      password: password,
    ));
  }

  Future<List<Map<String, dynamic>>> queryNotificacao() async {
    final result = await connection.execute(
      Sql.named(
          'SELECT * FROM tjse.notificacao'),
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByNome(String nome) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE nome ILIKE @nome ORDER BY ano desc'),
      parameters: {'nome': '%$nome%'},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByCargo(String cargo) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE cargo ILIKE @cargo ORDER BY ano desc'),
      parameters: {'cargo': '%$cargo%'},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByLotacao(String lotacao) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE lotacao ILIKE @lotacao ORDER BY ano desc'),
      parameters: {'lotacao': '%$lotacao%'},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByMesAno(
      String mes, String ano) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE mes = @mes AND ano = @ano'),
      parameters: {'mes': mes, 'ano': int.parse(ano)},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByFaixaSalarial(
      String min, String max) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE rend_liquido >= @min AND rend_liquido <= @max ORDER BY ano desc'),
      parameters: {'min': double.parse(min), 'max': double.parse(max)},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByAvancada(String nome, String cargo,
      String lotacao, String ano, String mes, String min, String max) async {
    String query = 'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE 1=1';

    final Map<String, dynamic> parameters = {};

    if (nome.isNotEmpty) {
      query += ' AND nome ILIKE @nome';
      parameters['nome'] = '%$nome%';
    }

    if (cargo.isNotEmpty) {
      query += ' AND cargo ILIKE @cargo';
      parameters['cargo'] = '%$cargo%';
    }

    if (lotacao.isNotEmpty) {
      query += ' AND lotacao ILIKE @lotacao';
      parameters['lotacao'] = '%$lotacao%';
    }

    if (mes.isNotEmpty) {
      query += ' AND mes = @mes';
      parameters['mes'] = mes;
    }

    if (ano.isNotEmpty) {
      query += ' AND ano = @ano';
      parameters['ano'] = int.parse(ano);
    }

    if (min.isNotEmpty) {
      query += ' AND rend_liquido >= @min';
      parameters['min'] = double.parse(min);
    }

    if (max.isNotEmpty) {
      query += ' AND rend_liquido <= @max';
      parameters['max'] = double.parse(max);
    }

    query += ' ORDER BY ano desc';

    final result = await connection.execute(Sql.named(query), parameters: parameters);

    return result.toList().map((row) => row.toColumnMap()).toList();
  }


}
