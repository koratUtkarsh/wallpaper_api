import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_api/screen/home_screen/model/home_model.dart';

class ApiHelper
{
  static final helper = ApiHelper._();
  ApiHelper._();

  Future<HomeModel> getApi({required choiseColor})
  async {
    Uri link = Uri.parse("https://pixabay.com/api/?key=41489536-39f8f8c0a87deb4365a0e3b3f&q=$choiseColor+flowers&image_type=photo");
    var respone = await http.get(link);
    var json = jsonDecode(respone.body);
    HomeModel homeModel = HomeModel.fromJson(json);
    return homeModel;
  }
}