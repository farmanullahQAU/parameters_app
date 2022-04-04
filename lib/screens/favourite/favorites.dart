import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/screens/home/home_controller.dart';

import '../home/home_view.dart';

class FavoriteView extends StatelessWidget {
  final controller=Get.find<HomeController>();
   FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       ListView.builder(
            
            itemCount: controller.tyresList.where((model) =>model.wheel.isFavorite==true ).length,
            
            itemBuilder: (context,index){
    final _tyreModel=controller.tyresList[index];
    
            return HomeView().addStack(_tyreModel,index);
          }),
    );
  }
}