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

import '../../components/dropdown_form_field.dart';
import '../../components/mybutton.dart';
import '../../components/text_field.dart';
import '../home/home_controller.dart';



class SearchView extends StatelessWidget {
final _controller=Get.find<SearchViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("kkk"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    
    
    
    Row(children: [
    
    
      InkWell(
            
            onTap: (){
    
              _controller.isExactWidth.value=true;
            },
            child: Chip(label: Text('Less or Equal'),)),
    
    
      InkWell(
        
        onTap: (){

                         _controller.isExactWidth.value=false;

        },
        child: CircleAvatar(child: Text('50'),))
    ,
      CircleAvatar(child: Text('60'),)
    
    ],),
    
        
    Obx(()=>
    
    _controller.isExactWidth.isTrue?

addWidthValueRow():

_addWidthSlider()




    )
            
          ],
        ),
      ),
    );
  }

  _addWidthSlider(){

        return Hero(
          tag: 1,
          child: RangeSlider(
                    values: _controller._currentRangeValues.value,
                    max: 100,
                    divisions: 5,
                    labels: RangeLabels(
                   _controller.     _currentRangeValues.value.start.round().toString(),
                 _controller.       _currentRangeValues.value.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                   
                     _controller.   _currentRangeValues.value = values;
                      
                    },
                  ),
        );
  }

  
  
  Widget
  addWidthValueRow() {
    return Container(
      color:Theme.of(Get.context!).primaryColor,
      height: 200,
      child: Hero(
        tag: 1,
   
        
        child: Column(
          children: [
            Expanded(
              
        
              child: Container(
                child: ListView.builder(
                  
                
                scrollDirection: Axis.horizontal,
                
                  shrinkWrap: false,
                  
                  itemCount: rimDimetersValues.length,
                  
                  itemBuilder: (_,index){
                    final dimeter=rimDimetersValues[index];
                
                  return Obx(()=>
                  
                     
                  
                   InkWell(
                     onTap: (){
                    
                       _controller.currentRimDimeter=dimeter;
                     },
                     child: CircleAvatar(
                       
                   backgroundColor: 
                   
                   
                              _controller.currentRimDimeter==dimeter?
                   
                           
                              null:
                                 
                                    Theme.of(Get.context!).primaryColorLight
                   
                   ,           
                       child: Text(dimeter.toString()),),
                   ));
                }),
              ),
            ),
        
        
        
            Flexible(
              child: ListView.builder(
                
              
              scrollDirection: Axis.horizontal,
              
                shrinkWrap: true,
                
                itemCount: rimWidthValues.length,
                
                itemBuilder: (_,index){
                  final width=rimWidthValues[index].toDouble();
              
                return Obx(()=>
                
                   
                
                 InkWell(
                   onTap: (){
                  
                     _controller.currentRimWidthIndex=width;
                   },
                   child: CircleAvatar(
                     
                 backgroundColor: 
                 
                 
                            _controller.currentRimWidthIndex==width?
                 
                         
                            null:
                               
                                  Theme.of(Get.context!).primaryColorLight
                 
                 ,           
                     child: Text(width.toString()),),
                 ));
              }),
            ),
        
        
        
        
        
          ],
        ),
      
        ),
    );



    
  }



}





class SearchViewController extends GetxController{

   final RxDouble? _currentRimWidthIndex=4.0.obs;
   double? get currentRimWidthIndex=>_currentRimWidthIndex?.value;

   set currentRimWidthIndex(double? index)=>_currentRimWidthIndex?.value=index!;
   final RxInt? _currentRimDimeter=12.obs;
   int? get currentRimDimeter=>_currentRimDimeter?.value;

   set currentRimDimeter(int? dimeter)=>_currentRimDimeter?.value=dimeter!;


  final _currentRangeValues = const RangeValues(40, 80).obs;

  final isExactWidth=false.obs;


}

