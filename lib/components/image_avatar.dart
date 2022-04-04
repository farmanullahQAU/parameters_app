import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageAvatar extends StatelessWidget {
  final String imageUrl;
  final Alignment? alignment;
  const ImageAvatar({Key? key,required this.imageUrl,required this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment!,
      child: CircleAvatar(
    backgroundColor: Theme.of(context).dividerColor,
        radius: 43,
        child: CircleAvatar(
          radius: 40,
          
          child:Image.asset(imageUrl,fit: BoxFit.cover,) ),
      ),
    );
  }
}

