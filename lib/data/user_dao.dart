import 'package:review_app/data/db_helper.dart';
import 'package:review_app/models/user.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao{
  Future<User> createUser(User user) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    db
        .rawQuery("SELECT * FROM user WHERE email = '${user.email}'")
        .then((value) {
      if (value.isNotEmpty) {
        throw Exception("Usuário já existe");
      }
    });

    await db.insert("user", user.toJson());

    return user;
  }

  Future<User> login(String email, String password) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$email' AND password = '$password'");
    if (maps.isNotEmpty) {
      logout().then( (value) async => { await db.insert('logged_user', maps.first) });
      return User.fromJson(maps.first);
    } else {
      throw Exception("Usuário não encontrado");
    }
  }

  Future<bool> logout() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();
    
    await db.rawQuery("DELETE FROM logged_user");
    return true;
  }
}