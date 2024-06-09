// import 'dart:io';
//
// import '/companion_direct/controller/auth/sign_up/sign_up_kyc_verification_controller/sign_up_kyc_verification_controller.dart';
// import '/companion_direct/utils/custom_color.dart';
// import '/companion_direct/utils/dimensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import 'package:image_picker/image_picker.dart';
//
// import '../../../backend/utils/custom_snackbar.dart';
//
//
// File? imageFile;
//
// class KycImageWidget extends StatelessWidget {
//   KycImageWidget(
//       {Key? key, required this.labelName, required this.fieldName})
//       : super(key: key);
//
//   final controller = Get.put(SignUpKycVerificationController());
//   final String labelName;
//   final String fieldName;
//
//   Future pickImage(imageSource) async {
//     try {
//       final image =
//       await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
//       if (image == null) return;
//
//       imageFile = File(image.path);
//
//       if (controller.listFieldName.isNotEmpty) {
//         if (controller.listFieldName.contains(fieldName)) {
//           int itemIndex = controller.listFieldName.indexOf(fieldName);
//           controller.listFieldName[itemIndex] = fieldName;
//           controller.listImagePath[itemIndex] = imageFile!.path;
//         } else {
//           controller.listImagePath.add(imageFile!.path);
//           controller.listFieldName.add(fieldName);
//         }
//       } else {
//         controller.listImagePath.add(imageFile!.path);
//         controller.listFieldName.add(fieldName);
//       }
//
//       Get.back();
//       CustomSnackBar.success('$labelName Added');
//     } on PlatformException catch (e) {
//       CustomSnackBar.error('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) => imagePickerBottomSheetWidget(context),
//         );
//       },
//       child: Container(
//         // height: MediaQuery.of(context).size.height * 0.10,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.radius * 2),
//           border: Border.all(
//             width: 1,
//             color: CustomColor.primaryLightColor,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.file_upload,
//               color: CustomColor.primaryLightColor,
//             ),
//             SizedBox(
//               width: Dimensions.widthSize * 0.5,
//             ),
//             Text(
//               labelName,
//               style: TextStyle(
//                 color: CustomColor.primaryLightColor,
//                 fontSize: Dimensions.headingTextSize6,
//                 fontWeight: FontWeight.w200,
//               ),
//               // overflow: TextOverflow.ellipsis,
//               // maxLines: 2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   imagePickerBottomSheetWidget(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height * 0.15,
//       margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(Dimensions.paddingSize),
//             child: IconButton(
//                 onPressed: () {
//                   pickImage(ImageSource.gallery);
//                 },
//                 icon: const Icon(
//                   Icons.image,
//                   color: CustomColor.primaryLightColor,
//                   size: 50,
//                 )),
//           ),
//           Padding(
//             padding: EdgeInsets.all(Dimensions.paddingSize),
//             child: IconButton(
//                 onPressed: () {
//                   pickImage(ImageSource.camera);
//                 },
//                 icon: const Icon(
//                   Icons.camera,
//                   color: CustomColor.primaryLightColor,
//                   size: 50,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import '/companion_direct/controller/auth/sign_up/sign_up_kyc_verification_controller/sign_up_kyc_verification_controller.dart';
import '/companion_direct/utils/dimensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../companion_customer/utils/custom_color.dart';
import '../../../companion_customer/widgets/others/custom_image_widget.dart';

File? imageFile;

class KycImageWidget extends StatefulWidget {
  const KycImageWidget(
      {super.key, required this.labelName, required this.fieldName});

  final String labelName;
  final String fieldName;

  @override
  State<KycImageWidget> createState() => _DropFileState();
}

class _DropFileState extends State<KycImageWidget> {
  final controller = Get.put(SignUpKycVerificationController());

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
      if (image == null) return;

      imageFile = File(image.path);

      if (controller.listFieldName.isNotEmpty) {
        if (controller.listFieldName.contains(widget.fieldName)) {
          int itemIndex = controller.listFieldName.indexOf(widget.fieldName);
          controller.listFieldName[itemIndex] = widget.fieldName;
          controller.listImagePath[itemIndex] = imageFile!.path;
        } else {
          controller.listImagePath.add(imageFile!.path);
          controller.listFieldName.add(widget.fieldName);
        }
      } else {
        controller.listImagePath.add(imageFile!.path);
        controller.listFieldName.add(widget.fieldName);
      }
      setState(() {
        controller.updateImageData(widget.fieldName, imageFile!.path);
      });
      Get.back();
      // CustomSnackBar.success('$labelName Added');
    } on PlatformException catch (_) {
      // CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: imageFile == null
          ? Colors.transparent
          : CustomColor.primaryLightScaffoldBackgroundColor,
      child: DottedBorder(
        dashPattern: const [4, 2],
        strokeWidth: 2,
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        child: Container(
          height: Dimensions.heightSize * 7,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.2,
            vertical: Dimensions.marginSizeVertical * 0.2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: controller.getImagePath(widget.fieldName) == null
                  ? AssetImage(Assets.card.idcardBack.path) as ImageProvider
                  : FileImage(
                      File(
                        controller.getImagePath(widget.fieldName) ?? '',
                      ),
                    ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              openImageSourceOptions(
                context,
              );
            },
            child: CustomImageWidget(
              path: Assets.icon.camera,
              height: Dimensions.heightSize * 1.4,
            ),
          ),
        ),
      ),
    );
  }

  openImageSourceOptions(
    BuildContext context,
  ) {
    showGeneralDialog(
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: Dimensions.heightSize * 13,
                width: Dimensions.widthSize * 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.camera_alt,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                        ),
                        Text(
                          'from Camera',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.headingTextSize4),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.photo,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          onTap: () {
                            pickImage(ImageSource.gallery);
                          },
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.headingTextSize4),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim),
            child: child,
          );
        });
  }
}
