import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../Model/usermodel.dart';
import '../constants/showtoast.dart';

class DbHelper{
  static Database? _db;

  //Database Name
  static const String dbname = 'test.db';
  //Table Name
  static const String tableuser = 'user';
  //db version
  static const int version = 1;

  static const String cUserName = 'name';
  static const String cEmail = 'email';
  static const String cPhone = 'phone';
  static const String cPassword = 'password';

  //database function
   Future<Database?> get db async{
    //agar db pehly se create huwa wa hu
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db;
  }

    initDb()async{
    //ye apke liyay path create kr rha ha mobile k andaar(database ko create krrha ha for localstorage memory)
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    //creating path
    String path = join(documentDirectory.path, dbname);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }
  _onCreate (Database db , int version) async {
    //await db.execute("CREATE TABLE $tableuser (id INTEGER PRIMARY KEY , productID VARCHAR UNIQUE , productName TEXT , initialPrice INTEGER , productPrice INTEGER , quantity INTEGER , unitTag TEXT , image TEXT)");
    await db.execute("CREATE TABLE $tableuser ("
    " $cUserName TEXT, "
    " $cEmail TEXT, "
    " $cPhone TEXT, "
    " $cPassword TEXT, "
    "PRIMARY KEY ($cEmail)"             
    ")");
  }

  Future<int> savedata(UserModel user)async {
    var dbClient = await db;
    try {
      var res = await dbClient!.insert(tableuser, user.toMap());
    return res;
    
    } on DatabaseException {
      return alertDialog("Error: Already SignUp");
    }
    
  }

  Future<UserModel?> getloginuser(String useremail , String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $tableuser WHERE "
         "$cEmail = '$useremail' AND "
         "$cPassword = '$password'");

      if (res.isNotEmpty) {
        return UserModel.fromMap(res.first);
      }
      return null;
  }

  Future<int> updateuser(UserModel user)async{
    var dbClient = await db;
    var res = await dbClient!.update(tableuser, user.toMap(), where: '$cEmail = ?' , whereArgs: [user.email]);
    return res;
  }

  Future<int> deleteuser(String useremail)async{
    var dbClient = await db;
    var res = await dbClient!.delete(tableuser,  where: '$cEmail = ?' , whereArgs: [useremail]);
    return res;
  }
}