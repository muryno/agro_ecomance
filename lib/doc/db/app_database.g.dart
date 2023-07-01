// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao _userkDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_entity` (`email` TEXT, `address` TEXT, `dob` TEXT, `firstname` TEXT, `lastname` TEXT, `nationality` TEXT, `profile_pic` TEXT, `sex` TEXT, `practice_no` TEXT, `language` TEXT, `qualification` TEXT, `call_min` TEXT, `video_min` TEXT, `plan` TEXT, PRIMARY KEY (`email`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  UserDao get userkDao {
    return _userkDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userGeneralInsertionAdapter = InsertionAdapter(
            database,
            'user_entity',
            (UserGeneral item) => <String, dynamic>{
                  'email': item.email,
                  'address': item.address,
                  'dob': item.dob,
                  'firstname': item.firstname,
                  'lastname': item.lastname,
                  'nationality': item.nationality,
                  'profile_pic': item.profile_pic,
                  'sex': item.sex,
                  'practice_no': item.practice_no,
                  'language': item.language,
                  'qualification': item.qualification,
                  'call_min': item.call_min,
                  'video_min': item.video_min,
                  'plan': item.plan
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _user_entityMapper = (Map<String, dynamic> row) => UserGeneral(
      address: row['address'] as String,
      dob: row['dob'] as String,
      email: row['email'] as String,
      firstname: row['firstname'] as String,
      lastname: row['lastname'] as String,
      nationality: row['nationality'] as String,
      profile_pic: row['profile_pic'] as String,
      sex: row['sex'] as String,
      practice_no: row['practice_no'] as String,
      language: row['language'] as String,
      qualification: row['qualification'] as String,
      call_min: row['call_min'] as String,
      video_min: row['video_min'] as String,
      plan: row['plan'] as String);

  final InsertionAdapter<UserGeneral> _userGeneralInsertionAdapter;

  @override
  Future<UserGeneral> getUserRecord() async {
    return _queryAdapter.query('select * from user_entity',
        mapper: _user_entityMapper);
  }

  @override
  Future<void> saveUser(UserGeneral data) async {
    await _userGeneralInsertionAdapter.insert(
        data, sqflite.ConflictAlgorithm.replace);
  }
}
