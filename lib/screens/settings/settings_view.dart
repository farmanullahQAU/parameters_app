import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/screens/settings/settings_controller.dart';

import '../../constants/theme.dart';

class SettingsView extends StatelessWidget {
  final _settingsController =Get.find<SettingsController>();
   SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(settings),),
      
      body: Container(


      child: Column(children: [

 ListTile(
   title: Obx(()=>_settingsController.isDark? Text("Light"):Text("Dark")),
   trailing: Obx(
 
                   () => 
                  CupertinoSwitch(
                    activeColor: Theme.of(context).backgroundColor,
                    trackColor: Colors.cyan,
                               value: _settingsController.isDark,
                               onChanged: (val)=>_settingsController.changeTheme()
                             ),
                 ),
 ),
 IconButton(

   onPressed: (){

    Get.changeTheme(AppTheme.orangeTheme);

   },
   icon: Text("kkkkk")
 ),
      ],),
    ));
  }
}