
import 'package:get/get.dart';
import 'package:parametric_market_app/screens/chat/chat_controller.dart';
import 'package:parametric_market_app/screens/login/login_controller.dart';
import 'package:parametric_market_app/screens/signup/signup_controller.dart';
import 'package:parametric_market_app/screens/tabs/tabs_controller.dart';

import 'screens/add_new/add_parameters_controller.dart';
import 'screens/details_view/details_view_controller.dart';
import 'screens/home/home_controller.dart';
import 'screens/search/search_view_controller.dart';
import 'screens/settings/settings_controller.dart';


class Binder extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<HomeController>(() => HomeController());

     Get.lazyPut<TabsViewController>(() => TabsViewController());
     Get.put(AddParametersController());
     Get.put(SettingsController());
     Get.put(DetailsViewController());

     
     Get.lazyPut<SearchViewController>(() => SearchViewController());

     Get.lazyPut<LoginController>(() => LoginController());
     Get.lazyPut<ChatController>(() => ChatController());
     Get.lazyPut<SignupController>(() => SignupController());
     

    // Get.lazyPut<LibraryViewController>(() => LibraryViewController());
    // Get.lazyPut(() => VideosPlayerController());
    // Get.lazyPut(() => CameraRollViewController());

    // Get.lazyPut(() => ImageFilterViewController());
  }
}
