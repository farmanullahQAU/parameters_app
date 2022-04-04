// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/text_field.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/constants/theme.dart';

import '../../components/mybutton.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            child: Column(
            mainAxisSize: MainAxisSize.max,
              children: [
                ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: CustomClipPath(),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.9),
                        Theme.of(context).primaryColor.withOpacity(0.3),
                      ],
                    )),
                    width: Get.width,
                    height: Get.height * 0.3,
                    child: Center(child: _addHeadingtext()),
                  ),
                ),
               columSizedBox,
                Container(
                  //   decoration: BoxDecoration(
          
                  //   color: Colors.blueGrey,
          
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  //     shape: BoxShape.rectangle),
          
                  margin: EdgeInsets.symmetric(horizontal: 15),
          
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       TxtField(
                        prefixIcon: Icon(Icons.email),
                        isOutlined: true,
                        labelText: "Name",
                                             ),
               columSizedBox,
          
                      TxtField(
                        prefixIcon: Icon(Icons.email),
                        isOutlined: true,
                        labelText: "email",
                      ),
               columSizedBox,
          
                     
                      TxtField(
                        prefixIcon: Icon(Icons.lock),
                        isOutlined: true,
                        labelText: "Passsword",
                      ),
               columSizedBox,
          
                     
                      Container(
                        width: Get.width,
                        
                        child: MyButton(buttonText:signup.toUpperCase(), onTap: () {}),
                      ),
               columSizedBox,
          
                     
                      
                    ],
                  ),
                ),
              
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 100,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: TextSpan(
                              text: accountExistsText,
                              style: Theme.of(context).textTheme.subtitle1,
                              children: [
                                TextSpan(
                                    text: "Login",
                                    style: Theme.of(context).textTheme.subtitle1
                                        ?.copyWith(color: Theme.of(context).primaryColor))
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }

  Widget _addHeadingtext() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          signup.toUpperCase(),
          style: StyledText.actorFontStyle.copyWith(fontSize: 30),
        ),
        Text(signuptitle.toUpperCase()),
      ],
    );
  }


}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.2, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
