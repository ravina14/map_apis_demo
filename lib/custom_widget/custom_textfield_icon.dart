part of 'custom_widget_imports.dart';
class CustomTextFieldIcon extends StatelessWidget {
  const CustomTextFieldIcon({
    super.key,
    required this.icomnName,
    this.height = 10.0,
    this.width = 10.0,
    this.padding = 15.0,
  });
  final String icomnName;
  final double height;
  final double width;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding.r),
      child: Image.asset(icomnName,
      height: height.h,
      width: width.w,
      fit: BoxFit.contain,
      ),
    );
  }
}
