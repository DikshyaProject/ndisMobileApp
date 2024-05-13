import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/ft_theme_colors.dart';
import 'image_paths.dart';

class NetworkImagesWidgets extends StatelessWidget {
  NetworkImagesWidgets({Key? key, required this.url, this.fit, this.loaderColor})
      : super(key: key);
  String url;
  BoxFit? fit;
  Color? loaderColor;

  @override
  Widget build(BuildContext context) {
    var urlw = Uri.parse(url);
    return CachedNetworkImage(
      imageUrl: urlw.toString(),
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress, color: loaderColor ?? kColorThemePurpleColor))),
      errorWidget: (context, _, __) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "${imgPathGeneral}noimage.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
