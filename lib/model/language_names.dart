class LanguageNames {
  String zh;
  String en;

  LanguageNames({this.zh, this.en});

  LanguageNames.fromJson(Map<String, dynamic> json) {
    zh = json['zh'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zh'] = this.zh;
    data['en'] = this.en;
    return data;
  }
}