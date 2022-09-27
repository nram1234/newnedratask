

import 'package:dio/dio.dart';

import 'abstract_json_resource.dart';
import 'dio_singleton.dart';


abstract class ApiManager {
  final DioSingleton dioSingleton = DioSingleton();
  //final _storge= a.Get.find<SecureStorage>();
  /// Returns the API URL of current API ressource
  String apiUrl();

  AbstractJsonResource fromJson(data);

  Future<AbstractJsonResource?> getData({data}) async {

    AbstractJsonResource? json;
    var data;
    await dioSingleton.dio
        .get( apiUrl()  ,queryParameters: data )
        .then((value) {
          print(value.statusCode);
      if(value.statusCode!=200){
print("value.data !=200");
      }else{

        print("value.data ========200");
        data = value.data;
        json = fromJson(data);
      }


    });


    return json;
  }
  /// POST DATA TO SERVER
  Future<AbstractJsonResource?> post(Map dataToPost) async {
    AbstractJsonResource? jsonList;
    var data;

    // Options options = Options(headers: {
    //   "Accept": "application/json",
    //   'Content-Type': 'application/json',
    // },);
    print(dataToPost);
    await dioSingleton.dio
        .post(
        apiUrl(),
        data:  dataToPost,
      //  options: options
      // Options(
      //     followRedirects: false,
      //     validateStatus: (status) {
      //       return status < 500;
      //     }),
    )
        .then((value) {
print(value.data);
      data = value.data;
      jsonList = fromJson(data);
    });
    return jsonList;}
//

}
