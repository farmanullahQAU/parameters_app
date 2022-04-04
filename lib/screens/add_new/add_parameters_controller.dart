import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddParametersController extends GetxController {
  final ImagePicker _picker = ImagePicker();

XFile? imageFile;
final _isLoading=false.obs;

  pickProfileImage() async {

    try{
    _isLoading.value=true;
    imageFile= await _picker.pickImage(source: ImageSource.camera);
    update();




    _isLoading.value=false;
    }
    catch(error){
    _isLoading.value=false;

   Get.snackbar("Error", error.toString());

    }

  }
  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
