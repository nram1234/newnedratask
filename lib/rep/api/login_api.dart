
import '../../api_app.dart';
import '../abstract_json_resource.dart';
import '../api_manager.dart';
import '../json_model/logIn_odel.dart';

class LogInAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.loginUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return LogInModel.fromJson(data);
  }
  
}