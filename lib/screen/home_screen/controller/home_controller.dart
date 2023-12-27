import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wallpaper_api/screen/home_screen/model/home_model.dart';
import 'package:wallpaper_api/utils/api_helper.dart';

class HomeController extends GetxController {
  Rxn homeModel = Rxn<HomeModel>();

  Future<void> readApi({required choiseColor}) async {
    homeModel.value = await ApiHelper.helper.getApi(choiseColor: choiseColor);
  }
}
