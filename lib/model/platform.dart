import './language_names.dart';
class Platform {
  String id;
  LanguageNames names;
  Platform.fromJson(Map<String, dynamic> json)
    : id = json['id'].toString(),
      names = json['names'] != null ? LanguageNames.fromJson(json['names'] as Map<String, dynamic>) : {};
  Map<String, dynamic> toJson() => {
    'id': id,
    'names': names.toJson()
  };
  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"id\":\"$id\"");
    sb.write(",\"names\":\"$names\"");
    sb.write('}');
    return sb.toString();
  }
}