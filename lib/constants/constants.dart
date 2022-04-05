import 'package:flutter/material.dart';

const homeScaffoldColor = Color.fromRGBO(65, 128, 34, 1);

const String loginHeading = "Welcome";
const String accountExistsText="Already have an account? ";
const String accounDoesnotExistText="Don't have an account? ";



const String signup = "Signup";
const String login = "login";

const String welcomeText = "Sign in to see more features";
const String signuptitle = "Sign up to continue";


const String type = "type";
const String tyreProfile = "tyre Profile";
const String tyreThread = "tyre Thread";
const String tyreYear = "tyre Year";
const String tyreSession = "tyre Session";
const String description = "description";

//wheel
const String rimWidth = "Width";
const String rimOffset = "Offset";
const String rimBrand = "Brand";
const String rimDimeter = "Dimeter";
const String condition = "condition";

//bottom navigation bar item labels
const String home = "Home";
const String favorite = "Favorite";

const String search = "Search";
const String addNew = "New";
const String settings = "Settings";


//entryform  error messages

const String dimeterEmptyErrorMessage = "Select dimeter value";

const String priceEmptyErrorMessage = "Select price";
const String rimWidthEmptyErrorMessage = "Select rim width";
const String rimOffsetEmptyErrorMessage = "Select rim offset";
const String rimBrandEmptyErrorMessage = "Select rim brand";
const String rimDescriptionEmptyErrorMessage = "Add description";
//entryform  hint text

const String dimeterHintText = "Dimeter";

const String pricerHintText = "Price...";

const String rimWidthHintText = "width";

const String offsetHintText = "Offset";
const String brandHintText = "Brand";

const String descriptionHintText = "Descriptions...";
const String continueText = "CONTINUE";
//conditions





 const Widget columSizedBox= SizedBox(
                height: 20,
              );


 const Widget tenHeightSizedBox= SizedBox(
                height: 10,
              );

 const Widget eightWidthSizedBox= SizedBox(
                width: 8,
              );

const drawerColor = Color.fromARGB(255, 100, 69, 56);

final List<int> rimDimetersValues = [
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];



  final List<double> rimWidthValues = [
4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12,12.5
  ];

    final List<double> rimOffsetValues = [

  ];