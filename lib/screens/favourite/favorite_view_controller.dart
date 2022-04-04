import 'package:get/state_manager.dart';

import '../../models/tyre_model.dart';

class FavoriteViewController extends GetxController{

late final List<TyreModel> _favoriteList;

List<TyreModel> get favoriteList=>_favoriteList;


@override
  void onInit() {


    _favoriteList=<TyreModel>[].obs;
    super.onInit();
  }

  
}