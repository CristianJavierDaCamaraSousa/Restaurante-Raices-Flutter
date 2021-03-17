import 'package:mysql1/mysql1.dart';

class Database {
  MySqlConnection _conexion;
  ConnectionSettings config = new ConnectionSettings(
    host: '192.168.10.28',
    port: 3306,
    user: 'root',
    password: '',
    db: 'raices',
  );

  Database() {
    init();
  }

  Future init() async {
    this._conexion = await MySqlConnection.connect(config);
  }

  Future<String> impresionPrueba() async {
    String res = (await _conexion.query("Select * from trabajadores")) as String;
    return res;
  }
}
