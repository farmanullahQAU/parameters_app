import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/image_avatar.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/models/tyre_model.dart';
import 'package:parametric_market_app/screens/details_view/details_view.dart';

import '../../components/description_card.dart';
import '../home/home_controller.dart';

class HomeView extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            padding: EdgeInsets.only(left: 4, top: 10),
            itemCount: _controller.tyresList.length,
            itemBuilder: (context, index) {
              final _tyreModel = _controller.tyresList[index];

              return addStack(_tyreModel,index);
            }),
      ),
    );
  }

  _addFavouriteIcon(TyreModel model) {
    final index = _controller.tyresList.indexOf(model);

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
              _controller.tyresList[index] = model;
            },
            icon: _controller.tyresList[index].wheel.isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Theme.of(Get.context!).iconTheme.color,
                  )
                : Icon(Icons.favorite_border)),
      ),
    );
  }



  Widget addStack(TyreModel _tyreModel,int index) {

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
        
        tyreModel: _tyreModel,onTap: (){
      print("kkkkkk");
      
        Get.to(()=>DetailsViw(heroTagId: index.toString(),),arguments: _tyreModel);
      },),
    ),
  ),
),
                  _addFavouriteIcon(_tyreModel),

                  //if no image show default one

                  ImageAvatar(
                      alignment: Alignment.centerLeft,
                      imageUrl: _tyreModel.imageUrl ?? "images/mercury.png",
                     ),
                ],
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
