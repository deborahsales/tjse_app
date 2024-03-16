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

  Future<List<Map<String, dynamic>>> queryByNome(String nome) async {
    final result = await connection.execute(
      Sql.named(
          'SELECT nome, mes, ano, cargo, lotacao, rend_liquido, total_creditos, total_debitos FROM tjse.folha WHERE nome ILIKE @nome'),
      parameters: {'nome': '%$nome%'},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }

  Future<List<Map<String, dynamic>>> queryByCargo(String cargo) async {
    final result = await connection.execute(
      Sql.named('SELECT * FROM tjse.folha WHERE cargo = @cargo'),
      parameters: {'cargo': cargo},
    );
    return result.toList().map((row) => row.toColumnMap()).toList();
  }
}
