class Region {
  String country;
  String province;
  String city;
  Region.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    province = json['province'];
    city = json['city'];
  }
  Map<String, dynamic> toJson() => {
    'country': country,
    'province': province,
    'city': city,
  };
  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"country\":\"$country\"");
    sb.write(",\"province\":\"$province\"");
    sb.write(",\"city\":\"$city\"");
    sb.write('}');
    return sb.toString();
  }
}