import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/home_card.dart';
import 'package:parametric_market_app/components/image_avatar.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/models/tyre_model.dart';
import 'package:parametric_market_app/screens/details_view/details_view.dart';
import 'package:parametric_market_app/screens/home/home_controller.dart';

import '../../components/description_card.dart';

class HomeView extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.only(left: 4, top: 10),
            itemCount: controller.tyresList.length,
            itemBuilder: (context, index) {
              final _tyreModel = controller.tyresList[index];

              return HomeViewCard(tyreModel:_tyreModel,index:index);
            }),
      ),
    );
  }





}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    double timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'images/mercury.png',
          width: Get.width * 0.7,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: Container(
                  // The blue background emphasizes that it's a new route.
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'images/mercury.png',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HomeViewCard extends GetView<HomeController> {
  final TyreModel tyreModel;
  final int index;
  const HomeViewCard({Key? key,required this.tyreModel,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
                alignment: Alignment.centerLeft,
                children: [
                
SizedBox(
  height: 170,
  child:   Padding(
    //card padding
    padding: const EdgeInsets.only(left:35,right: 10),
    child:   SizedBox(
      child: ListViewCard(

        tagId: index.toString(),
    
        
        contentPadding: EdgeInsets.only(left: 50,right: 10,top: 10,),
        
        tyreModel: tyreModel,onTap: (){
      print("kkkkkk");
      
        Get.to(()=>DetailsViw(heroTagId: index.toString(),),arguments: tyreModel);
      },),
    ),
  ),
),
                  _addFavouriteIcon(tyreModel),

                  //if no image show default one

                  ImageAvatar(
                      alignment: Alignment.centerLeft,
                      imageUrl: tyreModel.imageUrl ?? "images/mercury.png",
                     ),
                ],
              );
 
  }

    _addFavouriteIcon(TyreModel model) {
    final index = controller.tyresList.indexOf(model);

    return Positioned(
      right: 10,
      top: 8,
      child: Obx(
        () => IconButton(
            onPressed: () {
              model.wheel.isFavorite = !model.wheel.isFavorite;
              model.wheel.isFavorite
                  ? BotToast.showText(text: "Added to favorite")
                  : BotToast.showText(text: "Removed from favorite");

              // BotToast.showCustomNotification(toastBuilder: (_){
              //   return Icon(Icons.face,color: Colors.red,);
              // });
              controller.tyresList[index] = model;
            },
            icon: controller.tyresList[index].wheel.isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Theme.of(Get.context!).iconTheme.color,
                  )
                : Icon(Icons.favorite_border)),
      ),
    );
  }
}