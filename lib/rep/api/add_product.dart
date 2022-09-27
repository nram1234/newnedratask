
import '../api_app.dart';
import '../abstract_json_resource.dart';
import '../api_manager.dart';
import '../json_model/add_product_model.dart';
import '../json_model/logIn_model.dart';
import '../json_model/register_model.dart';

class AddProductAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.addproductUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return AddProductModel.fromJson(data);
  }
  
}