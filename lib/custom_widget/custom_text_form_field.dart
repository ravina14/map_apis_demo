part of 'custom_widget_imports.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcomnName,
    this.suffixIcomnName,
    this.keyboardType = TextInputType.text,
    this.onPressSufixIcon,
    this.obscureText = false,
    this.fontSize = 20.0,
    this.fontWeight = FontWeight.normal,
    this.color = AppColor.primaryColor,
    this.labelColor = AppColor.secondaryColor,
    this.isShowLable = true,
    this.textAlign = TextAlign.start,
    this.validator,
    this.eyeColor = AppColor.secondaryColor,
  });
  final TextEditingController controller;
  final String hintText;
  final String? prefixIcomnName;
  final String? suffixIcomnName;
  final TextInputType keyboardType;
  final VoidCallback? onPressSufixIcon;
  final bool obscureText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color labelColor;
  final bool isShowLable;
  final TextAlign textAlign;
  final String? Function(String?)? validator;
  final Color eyeColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enableInteractiveSelection: false,
      obscureText: obscureText,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      keyboardType: keyboardType,
      showCursor: true,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          )
    
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          )
    
        ),
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: fontSize.sp,
        ),
        labelText: isShowLable ? hintText : null,
        hintStyle:  TextStyle(
          color: labelColor,
          fontSize: fontSize.sp,
        ),
        hintText: isShowLable ? null : hintText,
        prefixIcon: prefixIcomnName != null ? CustomTextFieldIcon(icomnName:prefixIcomnName!,) : null,
        suffixIcon: suffixIcomnName != null ? InkWell(onTap: onPressSufixIcon,child: Ink(child: CustomTextFieldIcon(icomnName:suffixIcomnName!,)),) : null,
       ),
    );
  }
}