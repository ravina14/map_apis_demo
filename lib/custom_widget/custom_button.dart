part of 'custom_widget_imports.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, 
    required this.title,
    required this.onPressed,
    this.fontSize = 25.0
  });
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      child:  Text(
        title,
        style: TextStyle(
          fontSize:fontSize.sp
        ),
      )
    );
  }
}