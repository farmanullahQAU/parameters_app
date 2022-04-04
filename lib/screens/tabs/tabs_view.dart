import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/theme.dart';
import 'package:parametric_market_app/screens/tabs/tabs_controller.dart';

class TabsView extends StatelessWidget {
  final _controller=Get.find<TabsViewController>();
   TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: _addBottomNavigationBar(),
      body
      : Container(
    
    
        child:Obx(
          ()=>
          
           _controller.tabs.elementAt(_controller.currentIndex)) ,
      ),
    );
  }

  _addBottomNavigationBar() {

return Obx(()=>
    BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      selectedItemColor: Theme.of(Get.context!).bottomNavigationBarTheme.selectedItemColor,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                      

              icon: Icon(Icons.home),
              label: home,
            ),
                 BottomNavigationBarItem(
                      

              icon: Icon(Icons.favorite),
              label: favorite,
            ),
            BottomNavigationBarItem(
              

              icon: Icon(Icons.search),
              label: search,
            ),
            BottomNavigationBarItem(
            backgroundColor: Theme.of(Get.context!).bottomNavigationBarTheme.backgroundColor,
              icon: Icon(Icons.add_box),
              label: addNew,
            ),
               BottomNavigationBarItem(
            backgroundColor: Theme.of(Get.context!).bottomNavigationBarTheme.backgroundColor,
              icon: Icon(Icons.settings),
              label: settings,
            ),
          ],
          currentIndex: _controller.currentIndex,
          onTap:(index)=> _controller.currentIndex=index,
        ),
);



  }
}