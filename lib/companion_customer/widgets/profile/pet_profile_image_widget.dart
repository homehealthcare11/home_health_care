import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../backend/utils/custom_snackbar.dart';
import '../../controller/update_pet/update_pet_image_controller.dart';
import '../../utils/basic_screen_imports.dart';

File? imageFile;
final imgController = Get.put(UpdatePetImageController());

Future pickImage(imageSource) async {
  try {
    final image = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 40, // define image quality
      maxHeight: 600, // image height
      maxWidth: 600, // image width
    );
    if (image == null) return;

    imageFile = File(image.path);
    imgController.setImagePath(imageFile!.path);
  } on PlatformException catch (e) {
    CustomSnackBar.error('Error: $e');
  }
}

class PetProfileViewWidget extends StatefulWidget {
  const PetProfileViewWidget(
      {Key? key,
      this.withButton = false,
      this.heightSize = 12.0,
      required this.img})
      : super(key: key);

  final bool withButton;
  final double heightSize;
  final String img;

  @override
  State<PetProfileViewWidget> createState() => _PetProfileViewWidgetState();
}

class _PetProfileViewWidgetState extends State<PetProfileViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _imageWidget(),
      ],
    );
  }

  _imageWidget() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 5)),
          child: Center(
            child: CircleAvatar(
              radius: Dimensions.radius * 6.2,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                  backgroundColor:
                      CustomColor.secondaryLightColor.withOpacity(0.3),
                  radius: Dimensions.radius * 5.8,
                  backgroundImage: pickedFile == null
                      ? NetworkImage(widget.img)
                      : FileImage(pickedFile!) as ImageProvider),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 100,
          right: 1,
          child: InkWell(
            onTap: () {
              _openImageSourceOptions(context, imgController);
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: CustomColor.whiteColor,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: CustomColor.primaryLightColor,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: CustomColor.whiteColor,
                  size: Dimensions.heightSize * 1.2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _openImageSourceOptions(BuildContext context, controller) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            ),
            content: SizedBox(
              width: 270,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSize),
                        child: IconButton(
                            onPressed: () {
                              chooseFromGallery();
                              // takePhoto(ImageSource.gallery);
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.image,
                              color: CustomColor.primaryLightColor,
                              size: 50,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSize),
                        child: IconButton(
                            onPressed: () {
                              chooseFromCamera();
                              // takePhoto(ImageSource.camera);
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.camera,
                              color: CustomColor.primaryLightColor,
                              size: 50,
                            )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -12,
                    right: -15,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  // takePhoto(ImageSource source) async {
  //   final pickedImage =
  //       await imagePicker.pickImage(source: source, imageQuality: 100);
  //
  //   pickedFile = File(pickedImage!.path);
  //   imageController.setImagePath(pickedFile!.path);
  //   setState(() {});
  // }

  Future chooseFromGallery() async {
    pickImage(ImageSource.gallery);
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   widget.image = File(pickedFile.path);
    setState(() {});
    // } else {}
  }

  Future chooseFromCamera() async {
    pickImage(ImageSource.camera);
    // final pickedFile = await picker.pickImage(source: ImageSource.camera);
    // if (pickedFile != null) {
    //   widget.image = File(pickedFile.path);
    setState(() {});
    // } else {}
  }
}

// File? pickedFile;
// ImagePicker imagePicker = ImagePicker();
//
// final imageController = Get.put(InputImageController());
//
// class InputImageController extends GetxController {
//   var isImagePathSet = false.obs;
//   var imagePath = "".obs;
//
//   void setImagePath(String path) {
//     imagePath.value = path;
//     isImagePathSet.value = true;
//   }
//
// }
