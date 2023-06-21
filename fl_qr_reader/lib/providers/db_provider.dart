import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fl_qr_reader/models/scan_model.dart';
export 'package:fl_qr_reader/models/scan_model.dart';

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._();
  
  DBProvider._();


  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }


   Future<Database> initDb() async {
        //Path BD
        Directory documentsDirectory =  await getApplicationDocumentsDirectory();
        final path = join(documentsDirectory.path,'ScansDb.db');


        //Creation Datab
        return await openDatabase(
          path,
          version: 3,
          onCreate: (db, version) async {
            await db.execute('''
              CREATE TABLE Scans(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  tipo TEXT,
                  valor TEXT
              )
            ''');  
          }
        );
    }


   Future<int> nuevoScanRaw(ScanModel scan) async{
        final db = await database;

        final id = scan.id;
        final tipo = scan.tipo;
        final valor = scan.valor;
        final res = await db.rawInsert(''' 
            insert into Scans(id, tipo, valor)
              values ($id, '$tipo', '$valor')
        ''');

        return res;
    }

    Future<int> newScan(ScanModel scan) async{
        final db = await database;
        final res = await db.insert('Scans',scan.toJson());

        return res;
    }

    Future<ScanModel?> getScanByID(int id) async{
        final db = await database;
        final res = await db.query('Scans', where: ' id = ?', whereArgs: [ id ]);
         
        return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
    }
    
    Future<List<ScanModel>?> getScanAll() async{
        final db = await database;
        final res = await db.query('Scans');
         
        return res.isNotEmpty 
              ?  res.map((e) => ScanModel.fromJson(e)).toList() 
              : null;
    }

    Future<List<ScanModel>?> getScanByTipo(String tipo) async{
        final db = await database;
        final res = await db.rawQuery(''' 
            select * from Scans where tipo = $tipo
        ''');
         
        return res.isNotEmpty 
              ?  res.map((e) => ScanModel.fromJson(e)).toList() 
              : null;
    }

    Future<int> updateScan(ScanModel scan) async{
        final db = await database;
        final res = await db.update('Scans',scan.toJson(), where: ' id = ?', whereArgs: [ scan.id ]);

        return res;
    }

    Future<int> deleteScan(int id) async{
        final db = await database;
        final res = await db.delete('Scans', where: ' id = ?', whereArgs: [ id ]);

        return res;
    }

    Future<int> deleteAllScan() async{
        final db = await database;
        final res = await db.rawDelete('''
          delete from  Scans
      ''');

        return res;
    }
}