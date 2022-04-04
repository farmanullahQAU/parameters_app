import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parametric_market_app/models/tyre_model.dart';

import '../constants/constants.dart';
import '../constants/text_styles.dart';

class ListViewCard extends StatelessWidget {

  final TyreModel tyreModel;
  final String tagId;
  final VoidCallback onTap;
  final EdgeInsetsGeometry contentPadding;
  const ListViewCard({Key? key,required this.tyreModel,required this.onTap,required this.contentPadding,required this.tagId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(

      onTap:onTap,
      child: Hero(
   

        tag:tagId,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10.0,
            child: Padding(
              padding: contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          
                children: [
                  Text(
                    "Mint condition ${tyreModel.wheel.rimWidth} x ${tyreModel.wheel.rimDimeter} ${tyreModel.wheel.shortDescription ?? ""}",
                    style: StyledText.bodyLarge,
                  ),
                  Divider(
                    thickness: 2,
                    endIndent: Get.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //dimeter
          
                          Row(
                            children: [
                              Text(
                                '${dimeterHintText}:',
                                style: StyledText.titleSmallGrey,
                              ),
                              eightWidthSizedBox,
                              Text(
                                tyreModel.wheel.rimDimeter.toString(),
                                style: StyledText.titleSmall
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
          
                          //rim width
                          Row(
                            children: [
                              Text("${rimWidth}:",
                                  style: StyledText.titleSmallGrey),
                              eightWidthSizedBox,
                              Text(tyreModel.wheel.rimWidth.toString(),
                                  style: StyledText.titleSmall
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
          
                          //condition
                          Row(
                            children: [
                              Text(condition, style: StyledText.titleSmallGrey),
                              eightWidthSizedBox,
                              Text(tyreModel.wheel.condition,
                                  style: StyledText.titleSmall
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text("${tyreModel.wheel.price} \$",
                            style: StyledText.titleSmall.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  tenHeightSizedBox,
                  Container(
                    child:
                    Text(tyreModel.description ?? "no description added"),
                  )
                ],
          
                //DESCRIPTION
              ),
            )),
      ),
    );
  }
}