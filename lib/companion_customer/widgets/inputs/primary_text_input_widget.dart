// import '/companion_customer/language/language_controller.dart';
//
// import '../../utils/basic_widget_imports.dart';
// import '../others/custom_image_widget.dart';
//
// class PrimaryTextInputWidget extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String icon;
//   final TextInputType? keyboardType;
//   final bool? readOnly;
//   final Color? color;
//   final double focusedBorderWidth;
//   final double enabledBorderWidth;
//   final Color borderColor;
//   final EdgeInsetsGeometry paddings;
//   final Widget? suffixIcon;
//   final VoidCallback? onTap;
//
//   const PrimaryTextInputWidget({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.keyboardType,
//     this.readOnly = false,
//     this.focusedBorderWidth = 2,
//     this.enabledBorderWidth = 2,
//     this.color = Colors.white,
//     required this.borderColor,
//     this.icon = "",
//     this.suffixIcon,
//     this.onTap,
//     required this.paddings,
//   }) : super(key: key);
//
//   @override
//   State<PrimaryTextInputWidget> createState() => _PrimaryTextInputWidgetState();
// }
//
// class _PrimaryTextInputWidgetState extends State<PrimaryTextInputWidget> {
//   FocusNode? focusNode;
//
//   @override
//   void initState() {
//     super.initState();
//     focusNode = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     focusNode!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final languageController = Get.put(LanguageController());
//     return Column(
//       children: [
//         SizedBox(
//
//           width: double.infinity,
//           child: TextFormField(
//             style: Get.isDarkMode
//                 ? CustomStyle.darkHeading4TextStyle
//                 .copyWith(color: CustomColor.primaryDarkColor)
//                 : CustomStyle.lightHeading4TextStyle
//                 .copyWith(color: CustomColor.primaryLightColor),
//             readOnly: widget.readOnly!,
//             textInputAction: TextInputAction.next,
//             controller: widget.controller,
//             keyboardType: widget.keyboardType,
//             validator: (String? value) {
//               if (value!.isEmpty) {
//                 return Strings.pleaseFillOutTheField;
//               } else {
//                 return null;
//               }
//             },
//             onTap: () {
//               setState(() {
//                 focusNode!.requestFocus();
//               });
//             },
//             onFieldSubmitted: (value) {
//               setState(() {
//                 focusNode!.unfocus();
//               });
//             },
//             focusNode: focusNode,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
//                 borderSide: BorderSide(
//                     color: widget.borderColor.withOpacity(0.15),
//                     width: widget.enabledBorderWidth),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
//                 borderSide: const BorderSide(
//                     color: CustomColor.primaryLightColor, width: 1),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
//                 borderSide: const BorderSide(color: Colors.red, width: 1),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
//                 borderSide: const BorderSide(color: Colors.red, width: 1),
//               ),
//               filled: true,
//               fillColor: widget.color,
//               contentPadding: const EdgeInsets.only(
//                   left: 16, right: 10, top: 20, bottom: 10),
//               hintText: languageController.getTranslation(widget.hintText),
//               hintStyle: Get.isDarkMode
//                   ? CustomStyle.darkHeading4TextStyle.copyWith(
//                 color: CustomColor.primaryDarkTextColor.withOpacity(0.3),
//                 fontWeight: FontWeight.w500,
//                 fontSize: Dimensions.headingTextSize3,
//               )
//                   : CustomStyle.lightHeading4TextStyle.copyWith(
//                 color: CustomColor.primaryLightTextColor.withOpacity(0.3),
//                 fontWeight: FontWeight.w500,
//                 fontSize: Dimensions.headingTextSize3,
//               ),
//               suffixIcon: widget.suffixIcon ?? const SizedBox.shrink(),
//               prefixIcon: widget.icon == ''
//                   ? null
//                   : Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: widget.paddings,
//                     child: CustomImageWidget(
//                       path: widget.icon,
//                       color: focusNode!.hasFocus
//                           ? CustomColor.primaryLightColor
//                           : CustomColor.primaryLightTextColor,
//                     ),
//                   ),
//                   Container(
//                     width: Dimensions.widthSize * .20,
//                     height: Dimensions.heightSize * 1.4,
//                     color: focusNode!.hasFocus
//                         ? CustomColor.primaryLightColor.withOpacity(.30)
//                         : CustomColor.primaryLightTextColor
//                         .withOpacity(.15),),
//                   horizontalSpace(Dimensions.widthSize)
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // CustomSize.heightBetween()
//       ],
//     );
//   }
// }
