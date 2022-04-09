import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/no_data_found.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/screens/home/home_view.dart';
import 'package:parametric_market_app/screens/search/search_view_controller.dart';

import '../../components/mybutton.dart';
import '../../components/text_field.dart';



class SearchView extends GetView<SearchViewController> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){

        controller.isExactWidth.value=!controller.isExactWidth.value;
      },child:
      
      
       Obx(()=>
       AnimatedSwitcher(
           
                            transitionBuilder: (child,animation)=>ScaleTransition(scale: animation,child: child,),
           
           duration: const Duration(milliseconds: 500),
           child:
           
           controller.isExactWidth.isTrue?
       
       
            const Center(
              
              key: const Key("1"),
              child: const Icon(Icons.filter_1)):
            
             const Center(
               key: const Key("2"),
               child: const Icon(Icons.search))),
       )
          ),
    
       appBar: AppBar(

         actions:
         
          [
         Obx(()=>
  controller.isSearching.isTrue?
              
              
              IconButton(onPressed: ()=>controller.isSearching.value=false, icon: const Icon(Icons.clear)):Container(),
         )],
         
         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
         
         title: const Text("filter"),),
      body: SingleChildScrollView(
    
    
        child: 
        Obx(()=>
           controller.isSearching.isTrue?
    
           controller.availableSearched.isEmpty?
         const Center(child: ShowStatus(path: 'images/lottie/no_data.json')):
    
           ListView.builder(
             shrinkWrap: true,
             
             itemCount: controller.availableSearched.length,
             itemBuilder: (context,index){
    
             final model=controller.availableSearched[index];
    
             return HomeViewCard(tyreModel: model, index: index);
           },):
        
    
        
          
          Obx(()=>
          
               
              
              AnimatedSwitcher(
                        transitionBuilder: (child,animation)=>SizeTransition(sizeFactor: animation,child: child,),
          
          
          duration: const Duration(milliseconds: 500),
          child:    controller.isExactWidth.isTrue?
              
          
          addWidthValueRow():
              
              AddSlioder()
              )
              
              
              
              
          )
        ),
      ),
    );
  }

 
  
  
  Widget
  addWidthValueRow() {
    return Column(
      key: const Key("1"),
      children: [
        SizedBox(
          height: 60,
     
          
    
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         const Text(rimDimeter),

              Expanded(
                child: ListView.builder(
                  
                
                scrollDirection: Axis.horizontal,
                
                  shrinkWrap: false,
                  
                  itemCount: rimDimetersValues.length,
                  
                  itemBuilder: (_,index){
                    final dimeter=rimDimetersValues[index];
                
                  return Obx(()=>
                  
                     
                  
                   InkWell(
                     onTap: (){
                    
                       controller.currentRimDimeter=dimeter;
                     },
                     child: AnimatedSwitcher(
                      //  transitionBuilder: (child,animation)=>SizeTransition(sizeFactor: animation,child: child,),
                       duration: const Duration(milliseconds: 1000),
                       child:
                       
                       controller.currentRimDimeter==dimeter?
                        CircleAvatar(
    key: const Key("selected"),

                         
                                        backgroundColor: null
                                  
                                        
                                        ,           
                         child: Text(dimeter.toString()),):
  CircleAvatar(
    key: const Key("unselected"),
                         
                                        backgroundColor: 
                                        
                                        
                            
                                   
                                      Theme.of(Get.context!).primaryColorLight
                                        
                                        ,           
                         child: Text(dimeter.toString()),),

                     ),
                   ));
                }),
              ),
         
         
            ],
          ),
        ),
    
    
    
        SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(rimWidth),
              Expanded(
                child: ListView.builder(
                  
                
                scrollDirection: Axis.horizontal,
                
                  shrinkWrap: true,
                  
                  itemCount: rimWidthValues.length,
                  
                  itemBuilder: (_,index){
                    final width=rimWidthValues[index].toDouble();
                
                  return Obx(()=>
                  
                     
                  
                   InkWell(
                     onTap: (){
                    
                       controller.currentRimWidthIndex=width;
                     },
                     child: CircleAvatar(
                       
                   backgroundColor: 
                   
                   
                              controller.currentRimWidthIndex==width?
                   
                           
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
     
        const SizedBox(height: 20,),   
    SizedBox(
      width: Get.width*0.9,
                              
                              child: MyButton(
                                icon: const Icon(Icons.search),
                                
                                buttonText: "Search", onTap:(){
                                  controller.isSearching.value=true;
                            
                                
                              } ),
                            ),
      ],
    );



    
  }



}











class AddSlioder extends GetView<SearchViewController> {



final controller=Get.find<SearchViewController>();

   AddSlioder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                
              Flexible(
                flex: 1,
                  child: Obx(()=>
                     RangeSlider(
                              values: controller.currentRimWidthRangeValues.value,
                             max: rimWidthMaximum,
                             min: rimWidthMinimum,
                        divisions: rimWidthMaximum.toInt(),
                              labels: RangeLabels(
                             controller.     currentRimWidthRangeValues.value.start.round().toString(),
                           controller.       currentRimWidthRangeValues.value.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                             
                               controller.   currentRimWidthRangeValues.value = values;
                          
                               print(values);
                                
                              },
                            ),
                
                            
                  ),
                ),
                _addAvatar("rim width")
              ],
            ),
      
            const SizedBox(height: 10,),
              Row(
                children: [
                 _addAvatar("rim dimeter"),
                  Flexible(flex: 1,
                    child: Obx(()=>
                     RangeSlider(
                              values: controller.currentDimeterRangeValues.value,
                            
                        divisions:rimDimeterMaximum.toInt(),
                        max:rimDimeterMaximum,
                        min: rimDimeterMinimum,
                              labels: RangeLabels(
                             controller.     currentDimeterRangeValues.value.start.round().toString(),
                           controller.       currentDimeterRangeValues.value.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                             
                               controller.   currentDimeterRangeValues.value = values;
                          
                               print(values);
                                
                              },
                            ),
                  
                            
                              ),
                  ),
                ],
              ),
                          Row(
                            children: [
                              Obx(()=>
               Flexible(
      
                 flex: 1,
                 child: RangeSlider(
                          values: controller.currentRimOffsetRangeValues.value,
                         max: rimOffsetMaximum,
                         min: -170,
                  divisions: rimOffsetMaximum.toInt(),
                          labels: RangeLabels(
                         controller.     currentRimOffsetRangeValues.value.start.round().toString(),
                       controller.       currentRimOffsetRangeValues.value.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                         
                           controller.   currentRimOffsetRangeValues.value = values;
                      
                           print(values);
                                
                          },
                        ),
               ),
      
                      
            ),
      
            _addAvatar("rim offset")
                            ],
                          ),
      
                    Row(
                      children: [
            _addAvatar("tyre width"),
      
                        Obx(()=>
               Flexible(
                 flex: 1,
                 child: RangeSlider(
                              values: controller.currentTyreWidthRangeValues.value,
                             max: tyreWidthMaximum,
                  divisions: tyreWidthMaximum.toInt(),
      
                  min: tyreWidthMinimum,
                              labels: RangeLabels(
                             controller.     currentTyreWidthRangeValues.value.start.round().toString(),
                           controller.       currentTyreWidthRangeValues.value.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                             
                               controller.   currentTyreWidthRangeValues.value = values;
                          
                               print(values);
                                
                              },
                            ),
               ),
      
                          
            ),
      
                      ],
                    ),
      
                    const SizedBox(height: 10,),
        
        SizedBox(
      
                          width: Get.width*0.9,
                          child: TxtField(
                            prefixIcon: const Icon(Icons.search),
                            isOutlined: true,
                            
                            labelText: "tyre ",),
                        ),
      
                               const SizedBox(height: 10,),
      
                        SizedBox(
      
                          width: Get.width*0.9,
                          child: TxtField(
                            prefixIcon: const Icon(Icons.search),
                            isOutlined: true,
                            
                            labelText: "tyre thread ",),
                        ),
                        const SizedBox(height: 10,),
      
      
                        SizedBox(
                          width: Get.width*0.9,
                          child: Row(
                            children: [
                        
                          Expanded(
                            child: Container(
                              
                              child: MyButton(
                                icon: const Icon(Icons.search),
                                
                                buttonText: "Search", onTap:(){
                                  controller.isSearching.value=true;
                            
                                
                              } ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  
                                  child: MyButton(
                                    icon: const Icon(Icons.clear),
                                    buttonText: "clear", onTap:(){

                                controller.restSlider();
                                    
                                  } ),
                                ),
                              ),
                            ],
                          ),
                        )
        
          ],
        ),
      ),
    );
  }
  Widget _addAvatar(String title){

     return Flexible(
                    flex: 0,
                    child: CircleAvatar(
                      radius: 30,
                      
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FittedBox(
                          
                          child: Text(title.capitalizeFirst!,style: StyledText.actorFontStyle,)),
                      ),));
  }
}
