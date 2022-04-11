import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/description_card.dart';
import 'package:parametric_market_app/components/image_avatar.dart';
import 'package:parametric_market_app/components/mybutton.dart';
import 'package:parametric_market_app/constants/firestore_constants.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:parametric_market_app/screens/chat/chat_controller.dart';

import '../../constants/constants.dart';
import '../../constants/text_styles.dart';
import '../../models/tyre_model.dart';
import '../chat/home.dart';
import 'details_view_controller.dart';

class DetailsViw extends StatelessWidget{
  final _controller=Get.find<DetailsViewController>();

  final TyreModel _tyreModel=Get.arguments;
  final String heroTagId;

  DetailsViw({Key? key,required this.heroTagId}) : super(key: key);
 
  @override
  
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(

       
       body: Stack(
         alignment: Alignment.topCenter,
         children: [
           Stack(
             alignment: Alignment.bottomCenter,
             children: [
               RepaintBoundary(
key: _controller.genKey,

                 child: Container(
                   margin: EdgeInsets.only(top: 50),
                   height: 400,
                   child: ListViewCard(
                            tagId: heroTagId,
                     
                      contentPadding: EdgeInsets.only(left: 10,right: 10,top: 30,),
                     
                     onTap: ()=>Get.back(),tyreModel: _tyreModel,),
               
               
                 ),
               ),
                         _addSocialButtons()

             ],
           ),

           ImageAvatar(  
             
             
                         imageUrl: _tyreModel.imageUrl ?? "images/mercury.png", alignment: Alignment.topCenter),
        
      
        
         ],
       )
     
   
   
//        Stack(
//         children: [
//           Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 45.0),
//                 width: Get.width,
//                 height: 400,
          
//                 child: RepaintBoundary(
//                   key: _controller.genKey,
//                   child: Card(
                  
//                      shape: BeveledRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                           ),
//                     elevation: 15.0,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left:50.0,bottom: 10,top: 40),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
                          
//                         children: [
                          
//                           Text("Mint condition ${tyreModel.wheel.rimWidth} x ${tyreModel.wheel.rimDimeter} ${tyreModel.wheel.shortDescription??""}",style: StyledText.bodyLarge,),
                          
//                           Divider(
//                             thickness: 2,endIndent: Get.width*0.1,),
                          
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              Column(
                               
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: [
                          
//                                  //dimeter
                          
//                            Row(
                           
                           
//                            children: [
                          
//                                   Text('${dimeterHintText}:',style: StyledText.titleSmallGrey,),
//                                     eightWidthSizedBox,
                          
//                                   Text(tyreModel.wheel.rimDimeter.toString(),style: StyledText.titleSmall.copyWith(fontWeight: FontWeight.bold),),
                          
//                                 ],),
                          
//                                 //rim width
//                                    Row(
                                     
                                     
                                     
//                                      children: [
                          
//                                   Text("${rimWidth}:",style: StyledText.titleSmallGrey),
//                                   eightWidthSizedBox,
                          
//                                   Text(tyreModel.wheel.rimWidth.toString(),style: StyledText.titleSmall.copyWith(fontWeight: FontWeight.bold)),

//                                 ],),
                          
//                                 //condition
//                                       Row(children: [
                          
//                                   Text(condition,style: StyledText.titleSmallGrey),
//                                       eightWidthSizedBox,
//                                   Text(tyreModel.wheel.condition,style: StyledText.titleSmall.copyWith(fontWeight: FontWeight.bold)),
                          
//                                 ],),
                          
                          
                          
                          
                          
//                              ],),
                          
//                              Padding(
//                                padding: const EdgeInsets.only(right:50.0),
//                                child: Text("${tyreModel.wheel.price} \$",style: StyledText.titleSmall.copyWith(
//                                  fontSize: 20,
                                 
                                 
//                                  fontWeight: FontWeight.bold)),
//                              )
//                            ],
//                          ),
                          
//                          tenHeightSizedBox,
                          
//                           Container(child: Text(tyreModel.description??"no description added"),),
//                           columSizedBox,
//                           _addSocialButtons()
                          
//                         ],
                          
//                           //DESCRIPTION
                          
                          
//                   ),
//                     )),
//                 ),
               
//               ),
      
      
      
// ImageAvatar(
  
//   alignment: Alignment.topCenter,
//   imageUrl: tyreModel.imageUrl??"images/mercury.png")
//         ],
      
      
//       )
      
      
      ),
  
  
  
   );
            
            

  }


  Widget _addSocialButtons(){


    return ButtonBar(children: [
      IconButton(
      
      icon: Icon(Icons.chat,size: 40,),
       onPressed: (){

         Get.to(()=>ChatHome());
       }),

IconButton(

  icon: Icon(Icons.share,size: 40,),
 onPressed: (){

Get.find<ChatController>().sendMessage("faK86D0KkadQ30jtRZIp");



 }),
 IconButton(

  icon: Icon(Icons.call,size: 40,),
 onPressed: (){}),
MyButton(
  primary: Colors.green,
  
  icon: Icon(Icons.whatsapp),
  buttonText: "whatsapp", onTap: () async {
final imageFile=await   _controller.takePicture();
        final FlutterShareMe flutterShareMe = FlutterShareMe();


    final response = await flutterShareMe.shareToWhatsApp(
              imagePath: imageFile.path,
              fileType : FileType.image);
  }),
  




    ],);
  }

}
class PreviewPage extends StatelessWidget {
  File? file;
   PreviewPage({Key? key,this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(child:Image.file(file!)),
    );
  }
}