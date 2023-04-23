class LocationDto {
  String name;
  String url;

  LocationDto({required this.url, required this.name});

  static LocationDto fromJson(Map<String, dynamic> parsedJson) {
    try{
      return LocationDto(url: parsedJson["url"], name: parsedJson["name"]);
    }catch(e){
      throw Exception("Json convert exception");
    }
  }
}
