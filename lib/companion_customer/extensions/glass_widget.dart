
import 'dart:ui';

import '../utils/basic_screen_imports.dart';

extension GlassWidget<T extends Widget> on T {
  ClipRRect customGlassWidget({
    double blurX = 5.0,
    double blurY = 5.0,
    Color tintColor = Colors.white,
    BorderRadius? clipBorderRadius = BorderRadius.zero,
    Clip clipBehaviour = Clip.antiAlias,
    TileMode tileMode = TileMode.clamp,
    CustomClipper<RRect>? clipper,
  }) {
    return ClipRRect(
      clipper: clipper,
      clipBehavior: clipBehaviour,
      borderRadius: clipBorderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurX,
          sigmaY: blurY,
          tileMode: tileMode,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: (tintColor != Colors.transparent)
                ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                tintColor.withOpacity(0.1),
                tintColor.withOpacity(0.08),
              ],
            )
                : null,
          ),
          child: this,
        ),
      ),
    );
  }
}









