import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/models/tyre_model.dart';

class HomeController extends GetxController{

 Rx< TyreModel>? _selectedModel;
set selectedModel(TyreModel? tyreModel)=>this._selectedModel?.value=tyreModel!;
TyreModel? get selectedModel=>_selectedModel?.value;
late final List<TyreModel> _tyresList;

List<TyreModel> get tyresList=>_tyresList;

@override
  void onInit() {

    _tyresList=[


      TyreModel(
        
        description: "Perfect condition 55x76 rim for sale , cash talk no low ballers. PM, call or whatsapp, price negiotiable. bla bla bla.....",
        
        wheel: WheelModel(

         price: 325, 

          condition: "new",
          
          
          shortDescription: "polished",
          rimOffset: 22, rimWidth: 55,rimDimeter: 76), type: "Rim", tyreWidth: 34),

            TyreModel(
             description: "Perfect condition 83x12 rim for sale , cash talk no low ballers. PM, call or whatsapp, price negiotiable. bla bla bla.....",

        
        wheel: WheelModel(
         price: 33, 

          condition: "new",
          
          rimOffset: 41, rimWidth: 83,rimDimeter: 12), type: "Rim", tyreWidth: 88),
            TyreModel(
              
             description: "Perfect condition 34x30 rim for sale , cash talk no low ballers. PM, call or whatsapp, price negiotiable......",

        
        wheel: WheelModel(
         price: 174, 

          condition: "Used",

          
          shortDescription: "Polished",
          rimOffset: 47, rimWidth: 34,rimDimeter: 30), type: "Rim", tyreWidth: 34),
            TyreModel(
        description: "Short offering descriptions3 goes here....",
        
        wheel: WheelModel(
         price: 423, 
          
          condition: "new",
          
          
          rimOffset: 4, rimWidth: 16,rimDimeter: 99), type: "Rim", tyreWidth: 32),
           TyreModel(
             
        description: "Short offering descriptions3 goes here....",
        
        wheel: WheelModel(
               price: 211, 

          condition: "used",

          shortDescription: "Used",
          
          rimOffset: 1, rimWidth: 12,rimDimeter: 99), type: "Tyre", tyreWidth: 66),
           TyreModel(
        description: "Short offering descriptions4 goes here....",
        
        wheel: WheelModel(
         price: 645, 
          
          condition: "new",
          
          
          rimOffset: 87, rimWidth: 43,rimDimeter: 90), type: "Wheel", tyreWidth: 12),
          TyreModel(
        description: "Short offering descriptions3 goes here....",
        
        wheel: WheelModel(
         price: 885, 

          condition: "new",
          
          
          rimOffset: 6, rimWidth: 43,rimDimeter: 90), type: "Wheel", tyreWidth: 12),
          TyreModel(
        description: "Short offering descriptions3 goes here....",
        
        wheel: WheelModel(
         price: 76, 

          condition: "new",
          
          
          rimOffset: 4, rimWidth: 43,rimDimeter: 22), type: "RIM", tyreWidth: 85),
          TyreModel(
        description: "Short offering descriptions3 goes here....",
        
        wheel: WheelModel(

         price: 876, 
          
          condition: "new",
          
          rimOffset: 33, rimWidth: 18,rimDimeter: 90), type: "TYRE", tyreWidth: 35),
        
    ].obs;
    super.onInit();
  }

}