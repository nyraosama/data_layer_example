class MovieDbEntity {
  static const fieldId = 'id';
  static const fieldTitle = 'title';
  static const fieldPosterPath = 'poster_path';
  static const fieldOverview = 'overview';

  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieDbEntity(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview});

  MovieDbEntity.fromMap(Map<String, dynamic> map)
      : id = map[fieldId] as int,
        title = map[fieldTitle] as String,
        posterPath = map[fieldPosterPath] as String,
        overview = map[fieldOverview] as String;

  Map<String, dynamic> toMap() => {
        fieldId: id,
        fieldTitle: title,
        fieldPosterPath: posterPath,
        fieldOverview: overview,
      };
}
