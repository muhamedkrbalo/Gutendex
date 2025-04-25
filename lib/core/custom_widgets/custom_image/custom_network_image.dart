import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:gutendex/core/images/app_images.dart';
import '../../theme/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;
  final bool hasZoom;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
    this.hasZoom = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => CupertinoActivityIndicator(
          color: AppColor.primaryColor(context),
        ),
        errorWidget: (context, url, error) => Image(
          image: const AssetImage(AppImages.assetsImagesErrorImage),
          fit: fit,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
