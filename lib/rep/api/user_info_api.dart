
import '../api_app.dart';
import '../abstract_json_resource.dart';
import '../api_manager.dart';

import '../json_model/user_info_model.dart';

class UserInfoAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.getUserInfoUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return UserInfoModel.fromJson(data);
  }
  
}