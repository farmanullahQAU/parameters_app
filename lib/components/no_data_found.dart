import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ShowStatus extends StatelessWidget {

  final String path;
  
  const ShowStatus({Key? key,required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path,width: Get.width*0.7);
  }
}