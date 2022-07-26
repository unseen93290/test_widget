import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_widget/data.dart';

class DatabaseJeux {
  //static Database? databaseDeJeux;
 // Future<Database?> database1 = await database;// Impossible car la creation de databse n'as pas ete faite probleme a cause du future car l edatabse attend le futur


  /*Future<Database?> get database async {
    if (database != null) {
      return databaseDeJeux;
    } else {
      databaseDeJeux = await createDatabase();
      return databaseDeJeux;
    }
  }*/

static Database creationDataBase = createDatabase();
//static Future<List> getcustomerDataBase = getCustomers();

 foo()  async{
  final user =  await getCustomers();
  print("$user ---------01");
}
  static createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'play_database.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }


  static void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE Customer ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "age INTEGER,"

        ")");
  }

Future<int> createCustomer(Jeux play) async {
  var result = await creationDataBase .insert("jeux", play.toMap());
  return result;
}

Future<List> getCustomers() async {

   var  result = await creationDataBase.query("jeux", columns: ["id", "name", "age",]);
   //return result.map((e) => Jeux.fromMap(e)).toList();

  return result.toList();
}
   /*initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'play_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE jeux(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }*/

 /*
 * void insertJeux(Jeux play) async {
    final  db = await databaseDeJeux;

    await db?.insert(
      'jeux',
      play.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }*/

  /*Future<List<Jeux>> getListJeux() async {
    final  db = await databaseDeJeux;
    print(db);
    final List<Map<String, dynamic>>? maps = await db!.query('jeux');
    return List.generate(maps!.length, (i) {
      print(maps.length);
      print(maps[i]);
      return Jeux(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }*/
}
