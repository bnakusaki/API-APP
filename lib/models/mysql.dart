import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'Local Server',
      user = 'root',
      password = 'AkuBen3819*',
      db = 'anonymous';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      user: user,
      port: port,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}
