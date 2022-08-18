import 'package:data_layer_example/data/database/dao/base_dao.dart';
import 'package:data_layer_example/data/database/entity/movie_db_entity.dart';

class MovieDao extends BaseDao {
  Future<List<MovieDbEntity>> selectAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(BaseDao.movieTableName);
    return List.generate(maps.length, (i) => MovieDbEntity.fromMap(maps[i]));
  }

  Future<void> insertAll(List<MovieDbEntity> movies) async {
    final db = await getDatabase();
    final batch = db.batch();

    for (final movie in movies) {
      batch.insert(BaseDao.movieTableName, movie.toMap());
    }

    await batch.commit();
  }
}
