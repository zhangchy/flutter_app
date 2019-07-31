import './language_names.dart';
class Genres {
  String genresId;
  LanguageNames names;

  Genres({this.genresId, this.names});

  Genres.fromJson(Map<String, dynamic> json) {
    genresId = json['genres_id'];
    names = json['names'] != null ? new LanguageNames.fromJson(json['names']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genres_id'] = this.genresId;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    return data;
  }
}