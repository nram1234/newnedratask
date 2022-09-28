
import '../api_app.dart';
import '../abstract_json_resource.dart';
import '../api_manager.dart';

import '../json_model/get_product_by_id.dart';
import '../json_model/user_info_model.dart';

class GetProductByIdAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
return APIApp.getProductByIdUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return GetProductById.fromJson(data);
  }
  
}