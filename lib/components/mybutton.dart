import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
    Function() onTap;
    Color? primary;

    String buttonText;
Widget? icon;
 MyButton({Key? key, required this.buttonText, required this.onTap,this.icon,this.primary}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      
    
      
      icon:icon??Container(width: 0.0,height: 0.0,) ,
      
        label: Text(buttonText),
        style:
            ElevatedButton.styleFrom(
              

shape:  const StadiumBorder(),


              
              primary:primary??Theme.of(context).primaryColor),
        onPressed: onTap);
  }
}
