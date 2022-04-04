import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DetailsViewController extends GetxController{
final GlobalKey genKey = GlobalKey();

  shareOnSocial(){


  }

Future<File> takePicture() async {
  File? file;

final boundary = genKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
final image = await boundary?.toImage();
final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
final imageBytes = byteData?.buffer.asUint8List();

if (imageBytes != null) {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = await File('${directory.path}/aa.png').create();
  File imageFile=await imagePath.writeAsBytes(imageBytes);
  file=imageFile;


  // Get.to(()=>PreviewPage(file: imageFile,));



}
return file!;

}
}

class PreviewPage extends StatelessWidget {
  File? file;
   PreviewPage({Key? key,this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(child:Image.file(file!)),
    );
  }
}