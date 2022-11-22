import 'package:f290_ddm2_favcontacts/model/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
// import '../model/contato.dart' as c;

class SQLiteOpenHelper {
  SQLiteOpenHelper._();
  static final SQLiteOpenHelper _sqLiteOpenHelper = SQLiteOpenHelper._();

  factory SQLiteOpenHelper() => _sqLiteOpenHelper;

  Database? _dataBase;

  Future<Database?> get dataBase async {
    if (_dataBase != null) {
      return _dataBase;
    } else {
      return _dataBase = await inicializarBancoDeDados();
    }
  }

  Future<Database> inicializarBancoDeDados() async {
    final dataBasePath = getDatabasesPath();
    final path = '$dataBasePath/contatos.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(''''
        CREATE TABLE IF NOT EXISTS ${Contato.tabela}(
          ${Contato.colunaId} INTEGER PRIMARY KEY,
          ${Contato.colunaNome} TEXT NOT NULL,
          ${Contato.colunaTelefone} TEXT NOT NULL,
          ${Contato.colunaEmail} TEXT,
          ${Contato.colunaUrlImagem} TEXT,
        )''');
      },
    );
  }

  Future<Contato> insert(Contato contato) async {
    var db = await dataBase;
    contato.id = await db?.insert(Contato.tabela, contato.toMap());
    return contato;
  }

  Future<List<Contato>> findAll() async {
    var db = await dataBase;

    List<Map<String, dynamic>> mapContatos =
        await db!.rawQuery('SELECT * FROM ${Contato.tabela};');

    var contatos = mapContatos.map((map) => Contato.fromMap(map)).toList();

    return contatos;
  }

  Future<int?> delete(int id) async {
    var db = await dataBase;
    return await db?.delete(Contato.tabela, where: 'id = ?', whereArgs: [id]);
  }

  Future<Contato> findById(int id) async {
    var db = await dataBase;

    List<Map<String, dynamic>>? map = await db?.query(Contato.tabela,
        columns: ['nome', 'email', 'telefone', 'urlImagem'],
        where: 'id = ?',
        whereArgs: [id],
        distinct: true);

    return Contato.fromMap(map!.first);
  }

  //TODO: Update e Count
}
