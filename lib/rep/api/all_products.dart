
import '../api_app.dart';
import '../abstract_json_resource.dart';
import '../api_manager.dart';
import '../json_model/all-products.dart';
import '../json_model/logIn_model.dart';
import '../json_model/register_model.dart';

class RegisterAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.allProductsUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return AllProductsModel.fromJson(data);
  }
  
}