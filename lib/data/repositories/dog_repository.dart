import 'package:sqflite/sqflite.dart';
import '../../core/database_helper.dart';
import '../models/dog_model.dart';

class DogRepository {
  Future<void> insertDog(Dog dog) async {
    final db = await DatabaseHelper.initDb();
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getDogs() async {
    final db = await DatabaseHelper.initDb();
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');
    return dogMaps.map((map) {
      return Dog(
          id: map['id'] as int,
          name: map['name'] as String,
          age: map['age'] as int);
    }).toList();
  }
}
