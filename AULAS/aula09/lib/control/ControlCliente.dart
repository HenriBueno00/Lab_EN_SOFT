import 'package:aula09/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class ControlCliente{
 static final _databaseName = "teste.db";
 static Database? database;

 ControlCliente();

 Future startDatabase() async{
   if (database !=null){
     return database;
   }
   database = await _openOrCreateDatabase();
   return database;
 }
 Future _openOrCreateDatabase() async{
   var databasesPath = await getDatabasesPath();
   String path = databasesPath + _databaseName;
   return await openDatabase(path, version: 1, onCreate: _onCreate);
 }
 Future _onCreate(Database db, int version) async{
   await db.execute(
       'CREATE TABLE IF NOT EXISTS CLIENTE(nome TEXT, endereco TEXT, '
           'cidade TEXT, nasc TEXT'
   );
 }
 Future<void> insertDatabase(Cliente cli) async {
   Database db = await startDatabase();
   String sql = "";
   sql = 'INSERT INTO Cliente (nome, cidade, endereco, nasc) VALUES (';
   sql = sql + "'" + cli.nome + "', " + "'" + cli.cidade + "', " +
       cli.endereco + "', " + "'" + cli.nascimento + "')";
   try {
     await db.rawInsert(sql);
     print('Cliente inserido!');
   } finally {
     //await db.close();
   }

   Future<List<Map<String, dynamic>>> queryFind(String parametro) async {
     Database db = await startDatabase();
     return await (db.rawQuery('SELECT * FROM cliente where nome like'
         + "'%" + parametro + "%'"));
   }
}




