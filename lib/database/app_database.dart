// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';
// import 'package:sembast_web/sembast_web.dart';

// class AppDatabase {
//   static bool isTestingMode = false;
//   static final AppDatabase _singleton = AppDatabase._();

//   static AppDatabase get instance => _singleton;

//   Completer<Database>? _dbOpenCompleter;

//   AppDatabase._();

//   final String testApplicationDatabase = 'test_database.db';
//   final String applicationDatabase = 'app_database.db';

//   Future<Database> get database async {
//     if (_dbOpenCompleter == null) {
//       _dbOpenCompleter = Completer();
//       if (isTestingMode) {
//         await _openDatabase(testApplicationDatabase);
//       } else {
//         await _openDatabase(applicationDatabase);
//       }
//     }
//     return _dbOpenCompleter!.future;
//   }

//   Future _openDatabase(String databaseName) async {
//     var dbPath = '/assets/db';
//     dynamic database;
//     if (!kIsWeb) {
//       final appDocumentDir = await getApplicationDocumentsDirectory();
//       dbPath = join(appDocumentDir.path, databaseName);
//       database = await databaseFactoryIo.openDatabase(dbPath);
//     } else {
//       database = databaseFactoryWeb;
//     }

//     _dbOpenCompleter!.complete(database);
//   }
// }
