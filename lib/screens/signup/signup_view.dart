// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/components/progress_indicator.dart';
import 'package:parametric_market_app/components/text_field.dart';
import 'package:parametric_market_app/constants/constants.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/constants/theme.dart';
import 'package:parametric_market_app/screens/login/login_controller.dart';
import 'package:parametric_market_app/screens/login/login_view.dart';
import 'package:parametric_market_app/screens/signup/signup_controller.dart';

import '../../components/mybutton.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

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
          
                  child: Form(

                    key:controller.registerKey ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         TxtField(
                           controller: controller.userNameTextEditingController,
                            validator: (value) => value == null || value == ""
                              ? "enter name"
                              : null,
                          prefixIcon: Icon(Icons.email),
                          isOutlined: true,
                          labelText: "Name",
                                               ),
                                 columSizedBox,
                            
                        TxtField(
                          controller: controller.emailTextEditingController,
                             validator: (value) => value == null || value == ""
                              ? "enter email"
                              : null,
                          prefixIcon: Icon(Icons.email),
                          isOutlined: true,
                          labelText: "Email",
                        ),
                                 columSizedBox,
                            
                       
                        TxtField(
                          obsecure: true,
                          controller: controller.passwordTextEditingController,
                             validator: (value) => value == null || value == ""
                              ? "enter password"
                              : null,
                          prefixIcon: Icon(Icons.lock),
                          isOutlined: true,
                          labelText: "Passsword",
                        ),
                                 columSizedBox,
                            
                       
                        Obx(()=>
                        AnimatedSwitcher(
                            transitionBuilder: (child,animation)=>ScaleTransition(scale: animation,child: child,),

                          
                        
                            duration: Duration(microseconds: 1000),
                            child: 
                            
                            controller.isLoading.isFalse?
                            
                            SizedBox(
                              key:Key("1"),
                              width: Get.width,
                              
                              child: MyButton(buttonText:signup.toUpperCase(), onTap: () async {
                          
                          
                                if(controller.registerKey.currentState!.validate())
                                {
                          
                                  controller.registerKey.currentState?.save();
                          
                          
                                  await controller.signUp();
                          
                                  Get.back();
                                }
                              }),
                            ):CircularProgressIndicator(key: Key("2"),)
                          ),
                        ),
                                 columSizedBox,
                            
                       
                        
                      ],
                    ),
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

                                  recognizer:  TapGestureRecognizer()
                                    ..onTap = () => Get.to(Loginview(),binding: BindingsBuilder.put(() => LoginController())),
                                    text: "Login",
                                    style: Theme.of(context).textTheme.subtitle1
                                        ?.copyWith(color: Colors.blue))
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
