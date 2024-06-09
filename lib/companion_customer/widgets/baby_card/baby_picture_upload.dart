// ignore: must_be_immutable

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../backend/utils/custom_snackbar.dart';
import '../../controller/add_baby/upload_baby_image_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

File? imageFile;
final imgController = Get.put(UploadBabyImageController());

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
    debugPrint(imgController.imagePath.value);
    debugPrint(imageFile!.path);
  } on PlatformException catch (e) {
    CustomSnackBar.error('Error: $e');
  }
}

// ignore: must_be_immutable
class BabyPictureUpload extends StatefulWidget {
  BabyPictureUpload({super.key, this.image, required this.title});

  File? image;
  String title;

  @override
  State<BabyPictureUpload> createState() => _BabyPictureUploadState();
}

class _BabyPictureUploadState extends State<BabyPictureUpload> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => openImageSourceOptions(context),
        );
      },
      child: DottedBorder(
        dashPattern: const [3, 3],
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.3,
          vertical: Dimensions.paddingSize * 0.8,
        ),
        radius: Radius.circular(Dimensions.radius * 0.8),
        color: CustomColor.primaryLightTextColor.withOpacity(0.15),
        strokeWidth: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          alignment: Alignment.center,
          height: Dimensions.heightSize,
          width: MediaQuery.of(context).size.width * 0.8,
          child: widget.image == null
              ? Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    CustomImageWidget(
                      path: Assets.icon.photo,
                    ),
                    horizontalSpace(Dimensions.widthSize),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      // height: MediaQuery.sizeOf(context).height * 0.1,
                      child: TitleHeading4Widget(
                        text: widget.title,
                        textOverflow: TextOverflow.ellipsis,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(0.2),
                        fontSize: Dimensions.headingTextSize5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  final picker = ImagePicker();

  Future chooseFromGallery() async {
    pickImage(ImageSource.gallery);
  }

  Future chooseFromCamera() async {
    pickImage(ImageSource.camera);
  }

  openImageSourceOptions(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SizedBox(
      width: double.infinity,
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
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.image,
                      color: CustomColor.primaryLightColor,
                      size: isTablet() ? 100 : 50,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.paddingSize),
                child: IconButton(
                    onPressed: () {
                      chooseFromCamera();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.camera,
                      color: CustomColor.primaryLightColor,
                      size: isTablet() ? 100 : 50,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
