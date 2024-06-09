import '../../utils/basic_screen_imports.dart';
import '../../widgets/favorite/favorite_widget.dart';

class FavoriteScreenMobileResponsive extends StatelessWidget {
  const FavoriteScreenMobileResponsive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleHeading3Widget(text: Strings.favorite.tr),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.5,
                  right: Dimensions.paddingSize * 0.5,
                  top: Dimensions.paddingSize),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 15, // The number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {}, child: const FavoriteListWidget());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
