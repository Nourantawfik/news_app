
import 'package:shared_preferences/shared_preferences.dart';

class ChacheHelper
{
static late SharedPreferences sharedPreferences ;

static int()  async
{
    sharedPreferences =  await SharedPreferences.getInstance() as SharedPreferences;
}

static Future<bool> saveData({required String key, required dynamic value})

 async {
   if (value is bool) return await  sharedPreferences.setBool(key, value) ;
   if (value is double) return await sharedPreferences.setDouble(key, value) ;
   if (value is String) return await sharedPreferences.setString(key, value) ;

     return sharedPreferences.setInt(key, value) ;

}

static dynamic getData({required String key})
{
 return sharedPreferences.get(key) ;

}




}