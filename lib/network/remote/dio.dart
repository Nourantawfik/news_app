import 'package:dio/dio.dart';

//منساش اعمل ال dio

class DioHelper
{

 static late  Dio dio;

 static init()
 {
   dio =Dio(
       BaseOptions(

         baseUrl:"https://newapi.org" ,
         receiveDataWhenStatusError: true ,
   ));}

  static  Future<Response> getData({
    required String Url ,
     Map<String ,dynamic>? query ,
     String lang = "ar" ,
     String? token ,
   }) async{

   dio.options.headers =
   {
     'Content-Type': 'application/json' ,
     'lang' : lang ,
     'Authorization' : token?? Null ,
   };
   return await  dio.get(Url , queryParameters: query );

  }

 }

