import 'package:booking_app/core/config/app_colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.child,
    this.border,
    this.boxShadow,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);
  final BoxFit fit;
  final double width;
  final double height;
  final BoxShape shape;
  final String imageUrl;
  final Widget? child;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      height: height,
      width: width,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Stack(
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: shape == BoxShape.rectangle
                          ? (borderRadius ?? BorderRadius.zero)
                          : BorderRadius.circular(1000),
                    ),
                  ),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        gradient: AppColors.mainGradent,
                      ),
                      width: width,
                      height: height,
                    ),
                  ),
                ),
                Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.white,
                    size: width / 6,
                  ),
                ),
              ],
            );

          case LoadState.completed:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: border,
                shape: shape,
                boxShadow: boxShadow,
                borderRadius: borderRadius,
                image: DecorationImage(
                  image: state.imageProvider,
                  fit: fit,
                ),
              ),
              child: child,
            );
          case LoadState.failed:
          default:
            return GestureDetector(
              onTap: () {
                state.reLoadImage();
              },
              child: Stack(
                children: [
                  ClipPath(
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: shape == BoxShape.rectangle
                            ? (borderRadius ?? BorderRadius.zero)
                            : BorderRadius.circular(1000),
                      ),
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          gradient: AppColors.mainGradent,
                        ),
                        width: width,
                        height: height,
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.refresh,
                      size: width / 6,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
