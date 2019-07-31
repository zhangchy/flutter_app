class Image {
  String imgHost;
  String imgPath;
  Image({
    this.imgHost,
    this.imgPath
  });
  Image.fromJson(Map<String, dynamic> json) {
    imgHost = json['img_host'];
    imgPath = json['img_path'];
  }
  Map<String, dynamic> toJson() => {
    'img_host': imgHost,
    'img_path': imgPath
  };
}