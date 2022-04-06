import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/models/tyre_model.dart';
import 'package:parametric_market_app/screens/home/home_controller.dart';
import 'package:parametric_market_app/screens/home/home_view.dart';

import '../../components/mybutton.dart';
import '../../components/text_field.dart';



class SearchView extends GetView<SearchViewController> {


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("kkk"),),
      body: Center(
        child: SingleChildScrollView(


          child: 
          Obx(()=>
             controller.isSearching.isTrue?

             controller.availableSearched.isEmpty?
             Text("no data available"):

             ListView.builder(
               shrinkWrap: true,
               
               itemCount: controller.availableSearched.length,
               itemBuilder: (context,index){

               final model=controller.availableSearched[index];

               return HomeViewCard(tyreModel: model, index: index);
             },):
          
            
            SizedBox(
              child: Column(
                children: [
                
                
                
                Row(children: [
                
                
                  InkWell(
                  
                  onTap: (){
                
                    controller.isExactWidth.value=true;
                  },
                  child: Chip(label: Text('Less or Equal'),)),
                
                
                  InkWell(
              
              onTap: (){
                    
                               controller.isExactWidth.value=false;
                    
              },
              child: CircleAvatar(child: Text('50'),))
                ,
                  CircleAvatar(child: Text('60'),)
                
                ],),
                
              
                Obx(()=>
                
                     
                    
                    AnimatedSwitcher(
                              transitionBuilder: (child,animation)=>SizeTransition(sizeFactor: animation,child: child,),
              
              
              duration: Duration(milliseconds: 500),
              child:    controller.isExactWidth.isTrue?
                    
              
              addWidthValueRow():
                    
                    AddSlioder()
                    )
                    
                    
                    
                    
                )
                  
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

 
  
  
  Widget
  addWidthValueRow() {
    return Column(
      key: Key("1"),
      children: [
        SizedBox(
          height: 60,
     
          
    
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         Text(rimDimeter),

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
                       duration: Duration(milliseconds: 1000),
                       child:
                       
                       controller.currentRimDimeter==dimeter?
                        CircleAvatar(
    key: Key("selected"),

                         
                                        backgroundColor: null
                                  
                                        
                                        ,           
                         child: Text(dimeter.toString()),):
  CircleAvatar(
    key: Key("unselected"),
                         
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

              Text(rimWidth),
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
     
           
    
      ],
    );



    
  }



}





class SearchViewController extends GetxController{

  List<TyreModel> get availableSearched=>Get.find<HomeController>().tyresList.where((model) =>model.wheel.rimWidth
  
  >=currentRimWidthRangeValues.value.start&&model.wheel.rimWidth<=
  
  currentRimWidthRangeValues.value.end
  
  
   ).toList();
    final isSearching=false.obs;

  @override
  void onInit() {
initSliders();
    _initRimOffsetValues();
    _currentRimOffsetValue=rimOffsetValues[0].obs;
    super.onInit();
  }

  initSliders(){


   currentRimWidthRangeValues =  const RangeValues(rimWidthMinimum,rimWidthMaximum).obs;
   currentDimeterRangeValues=   const RangeValues(rimDimeterMinimum,rimDimeterMaximum).obs;

   currentRimOffsetRangeValues =   const RangeValues(rimOffsetMinimum,rimOffsetMaximum).obs;


   currentTyreWidthRangeValues =  const RangeValues(tyreWidthMinimum,tyreWidthMaximum).obs;

  }
   restSlider(){


   currentRimWidthRangeValues.value=  const RangeValues(rimWidthMinimum,rimWidthMaximum);
   currentDimeterRangeValues.value=   const RangeValues(rimDimeterMinimum,rimDimeterMaximum);

   currentRimOffsetRangeValues.value=   const RangeValues(rimOffsetMinimum,rimOffsetMaximum);


   currentTyreWidthRangeValues.value =  const RangeValues(tyreWidthMinimum,tyreWidthMaximum);

  }

   final RxDouble? _currentRimWidthIndex=4.0.obs;
   double? get currentRimWidthIndex=>_currentRimWidthIndex?.value;

   set currentRimWidthIndex(double? index)=>_currentRimWidthIndex?.value=index!;
   final RxInt? _currentRimDimeter=12.obs;
   int? get currentRimDimeter=>_currentRimDimeter?.value;

   set currentRimDimeter(int? dimeter)=>_currentRimDimeter?.value=dimeter!;

  late final Rx<RangeValues> currentRimWidthRangeValues ;
  late final Rx<RangeValues>  currentDimeterRangeValues  ;

  late final Rx<RangeValues>  currentRimOffsetRangeValues ;


  late final Rx<RangeValues>  currentTyreWidthRangeValues;


   late final RxDouble? _currentRimOffsetValue;
   double? get currentRimOffsetValue=>_currentRimOffsetValue?.value;
   set currentRimOffsetValue(double? offset)=>_currentRimOffsetValue?.value=offset!;


  final isExactWidth=false.obs;
_initRimOffsetValues(){

  for(int i=-70;i<=130;i++)
  {

    rimOffsetValues.add(i.toDouble());
  }
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
      
            SizedBox(height: 10,),
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
      
                    SizedBox(height: 10,),
        
        SizedBox(
      
                          width: Get.width*0.9,
                          child: TxtField(
                            prefixIcon: Icon(Icons.search),
                            isOutlined: true,
                            
                            labelText: "tyre ",),
                        ),
      
                               SizedBox(height: 10,),
      
                        SizedBox(
      
                          width: Get.width*0.9,
                          child: TxtField(
                            prefixIcon: Icon(Icons.search),
                            isOutlined: true,
                            
                            labelText: "tyre thread ",),
                        ),
                        SizedBox(height: 10,),
      
      
                        SizedBox(
                          width: Get.width*0.9,
                          child: Row(
                            children: [
                        
                          Expanded(
                            child: Container(
                              
                              child: MyButton(
                                icon: Icon(Icons.search),
                                
                                buttonText: "Search", onTap:(){
                                  controller.isSearching.value=true;
                            
                                
                              } ),
                            ),
                          ),
                          SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  
                                  child: MyButton(
                                    icon: Icon(Icons.clear),
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
                        padding: EdgeInsets.all(4),
                        child: FittedBox(
                          
                          child: Text(title.capitalizeFirst!,style: StyledText.actorFontStyle,)),
                      ),));
  }
}
