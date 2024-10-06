part of 'custom_widget_imports.dart';
class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    
    return const PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(),
      )
      )
    ;
  }
}

showLoading(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return const CustomLoader();
    });
}

hideLoading(BuildContext context){
   Navigator.pop(context);
}