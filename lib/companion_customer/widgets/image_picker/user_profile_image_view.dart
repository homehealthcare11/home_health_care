import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../backend/services/api_endpoint.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../../companion_customer/utils/custom_color.dart';
import '../../../companion_customer/utils/dimensions.dart';
import '../../../companion_customer/widgets/others/custom_image_widget.dart';
import '../../controller/profile/profile_controller.dart';
import '/companion_customer/controller/profile/user_image_picker_controller.dart';
import '/companion_customer/custom_assets/assets.gen.dart';

//
File? imageFile;

class UserImagePickerWidget extends StatelessWidget {
  UserImagePickerWidget({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  final imgController = Get.put(UserProfileImagePicker());

  // image picker function
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

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(() {
      return Center(
        child: imgController.isImagePathSet.value == true
            ? GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        _imagePickerBottomSheetWidget(context),
                  );
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.paddingSize,
                      bottom: Dimensions.paddingSize,
                    ),
                    height: isTablet()
                        ? MediaQuery.sizeOf(context).height * 0.20
                        : Dimensions.heightSize * 8.3,
                    width: Dimensions.widthSize * 11.5,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 1.5),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.white, width: 5),
                      image: DecorationImage(
                        image: FileImage(
                          File(
                            imgController.imagePath.value,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            : _userImageWidget(context),
      );
    });
  }

  _imagePickerBottomSheetWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      width: isTablet() ? MediaQuery.sizeOf(context).width : double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  Get.back();
                  pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Theme.of(context).primaryColor,
                  size: isTablet() ? 100 : 50,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  Get.back();
                  pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Theme.of(context).primaryColor,
                  size: isTablet() ? 100 : 50,
                )),
          ),
        ],
      ),
    );
  }

  _userImageWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    var data = controller.profileModel.data;

    final image =
        '${ApiEndpoint.mainDomain}/${data.imagePath}/${data.user.image}';
    final defaultImage = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: Dimensions.paddingSize,
              bottom: Dimensions.paddingSize,
            ),
            height: isTablet()
                ? MediaQuery.sizeOf(context).height * 0.20
                : Dimensions.heightSize * 8.3,
            width: Dimensions.widthSize * 11.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              color: Theme.of(context).primaryColor,
              border: Border.all(color: const Color(0xff8D8D8D), width: 5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              child: FadeInImage(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                image:
                    NetworkImage(data.user.image != '' ? image : defaultImage),
                placeholder: AssetImage(
                  Assets.clipart.congratulations,
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    Assets.clipart.congratulations,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => _imagePickerBottomSheetWidget(context),
            );
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 2.6),
              child: CustomImageWidget(
                path: Assets.icon.camera,
                color: CustomColor.blackColor,
                height: Dimensions.heightSize * 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
