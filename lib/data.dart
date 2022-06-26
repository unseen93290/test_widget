import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Jeux {
  late int id;
  late String name;
  late int age;

  Jeux({required this.id,required this.age,required this.name});

  // pk je suis obliger de cree un constructeur si les variable son en statique ?


  Jeux.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"];


  Map<String, Object?> toMap() {
    return {'id':id,'name': name, 'age': age,};
  }
}
