import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../companion_direct/widgets/text_labels/title_heading5_widget.dart';
import '../../utils/basic_screen_imports.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget(
      {Key? key,
      required this.review,
      required this.rows,
      required this.imagePath})
      : super(key: key);

  // var data = Get.arguments;
  final String review;
  final int rows;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.631,
      child: Card(
        surfaceTintColor: CustomColor.whiteColor,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.375,
              top: Dimensions.paddingSize * 0.583,
              bottom: Dimensions.paddingSize * 0.25,
              right: Dimensions.paddingSize * 0.583),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: Dimensions.radius * 2.5,
                    backgroundImage: NetworkImage(imagePath),
                  ),
                  horizontalSpace(Dimensions.widthSize * 0.75),
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      RatingBar.builder(
                        initialRating: double.parse(rows.toString()),
                        minRating: 1,
                        tapOnlyMode: true,
                        ignoreGestures: true,
                        itemSize: 15.sp,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  )
                ],
              ),
              verticalSpace(Dimensions.heightSize * 0.667),
              TitleHeading5Widget(
                textOverflow: TextOverflow.ellipsis,
                maxLines: 5,
                text: review,
                // fontWeight: FontWeight.w700,
                color: CustomColor.primaryLightTextColor.withOpacity(0.30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
