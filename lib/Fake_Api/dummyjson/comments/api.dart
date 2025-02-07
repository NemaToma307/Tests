

import 'package:dio/dio.dart';

class ApiComments{


  Dio dio =  Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/comments',
      connectTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    ),
  );


  Future<Map<String,dynamic>> getAllDataComments() async
  {
    const url = '';
    try{
      Response response = await dio.get(url);
      print(" second 2");
      if(response.statusCode == 200) {
        print("here in response state code >_<");
        print(response.data);
        return response.data;
      }
      else {
        print("get 4 ");
        return {};
      }
    }on DioError catch(e){
      if(e.response!=null)
        print(e.response);
      else
        print(e.message);
      print("get5");
      return {};
    }
  }


}