import 'package:get/get.dart';

import '../../rep/api/get_product_by_id_api.dart';
import '../../rep/json_model/get_product_by_id.dart';

class ProductDetailsController extends GetxController{
  GetProductById? getProductById;
// get Product Details request
getProductDetails(String id){

  GetProductByIdAPI  getProductByIdAPI=GetProductByIdAPI();
  getProductByIdAPI.data=id;

  getProductByIdAPI.getData().then((value) {
    print(value);
    getProductById =value as GetProductById;
    update();
  });



}




}