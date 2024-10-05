part of 'custom_widget_imports.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key, 
    required this.imageUrl, 
    this.cornerRadius = 20.0, 
    this.height = 85.0, 
    this.width = 85.0, 
    this.fit = BoxFit.cover, 
    this.errorImageName = AppAssets.icPlaceholder,
  });
  final String imageUrl;
  final double cornerRadius;
  final double height;
  final double width;
  final BoxFit fit;
  final String errorImageName;
  @override
  Widget build(BuildContext context) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) {
          return Image(
            image: imageProvider,
            fit: fit,
          )
          .cornerRadius(cornerRadius.r)
          .h(height.h)
          .w(width.w);
        },
        progressIndicatorBuilder: (context, url, downloadProgress) => 
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => 
            Image.asset(
              errorImageName,
              fit: BoxFit.cover,
            )
            .h(height.h)
            .w(width.w),
    );
  }
}