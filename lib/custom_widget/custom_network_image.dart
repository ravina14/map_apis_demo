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
      return Image.network(
        imageUrl,
        width: width.w,
        height: height.h,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child; // The image has loaded
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          ); // Show the loading indicator while the image is loading
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Center(
            child: Icon(Icons.error), // Placeholder in case of an error
          );
        },
    ).cornerRadius(cornerRadius.r);
  }
}