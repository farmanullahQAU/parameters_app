import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../database_services/firestore_services.dart';
import '../tabs/tabs_controller.dart';
import '../tabs/tabs_view.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  late final TextEditingController emailTextEditingController;
  late final TextEditingController passwordTextEditingController;

  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.onInit();
  }

  login() async {
    try {
      isLoading.value = true;

      await FirestoreServices()
          .loginWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text);

      isLoading.value = false;
           Get.off(() => TabsView(),
                                          transition: Transition.zoom,
                                          binding: BindingsBuilder.put(
                                              () => TabsViewController()));
    } on FirebaseAuthException catch (e) {
  
      isLoading.value = false;

      if (e.code == 'user-not-found') {


        
    return await showErrorDialogue("No user found for that email.");

      } else if (e.code == 'wrong-password') {
        return showErrorDialogue("Wrong password provided for that user.");
      }
      else if(e.code=="invalid-email"){
        return showErrorDialogue("Your email is invalid");


      }
      else{

        return showErrorDialogue(e.code);

      }
    } catch (e) {

      isLoading.value = false;

             return showErrorDialogue(e.toString());

    }
  }


  showErrorDialogue(String error) async {


    return await Get.defaultDialog(
onCancel: (){},
      barrierDismissible: false,
      
      radius: 5.0,
      content: Text(error),
      title: "Error ❎");
  }
}
