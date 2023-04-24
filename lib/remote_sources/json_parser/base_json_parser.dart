
abstract class BaseJsonParser<T>{

  const BaseJsonParser();
  T fromJson(Map<String,dynamic> json);
  String toJson();

}