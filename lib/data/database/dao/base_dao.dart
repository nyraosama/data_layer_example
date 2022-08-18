import 'package:data_layer_example/data/database/entity/movie_db_entity.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  static const databaseName = 'data-layer-example.db';
  static const movieTableName = 'movie';

  @protected
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createMovieTable(batch);
        await batch.commit();
      },
      version: 1,
    );
  }

  void _createMovieTable(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE $movieTableName(
      ${MovieDbEntity.fieldId} INTEGER NOT NULL,
      ${MovieDbEntity.fieldTitle} TEXT NOT NULL,
      ${MovieDbEntity.fieldPosterPath} TEXT NOT NULL,
      ${MovieDbEntity.fieldOverview} TEXT NOT NULL
    );
    ''',
    );
  }
}
