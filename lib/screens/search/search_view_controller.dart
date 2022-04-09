
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../models/tyre_model.dart';
import '../home/home_controller.dart';

class SearchViewController extends GetxController{

  List<TyreModel> get availableSearched=>Get.find<HomeController>().tyresList.where((model) =>((model.wheel.rimWidth
  
  >=currentRimWidthRangeValues.value.start)&&(model.wheel.rimWidth<=
  
  currentRimWidthRangeValues.value.end))



  
  
   ).where((model) => (model.wheel.rimDimeter!
  
                    >=currentDimeterRangeValues.value.start)&&(model.wheel.rimDimeter!<=
  
  currentDimeterRangeValues.value.end)).toList();
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

