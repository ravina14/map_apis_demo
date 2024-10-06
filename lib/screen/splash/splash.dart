part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {  
  @override
  void initState() {
    super.initState();
     _checkLocationPermission();
     Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        setState(() {
          AutoRouter.of(context).replace(const LoginRoute());
        });
      } else {
        VxToast.show(context, msg: "Location Not Enable");
      }
    });
  }
  void checkForLogin() async {
  // Perform some asynchronous operation
  await Future.delayed(Duration(seconds: 2));

  // Check if the widget is still mounted
  if (!mounted) return;

  // Use context safely here
  AutoRouter.of(context).replace(const LoginRoute());
}
  // checkForLogin() async{
  //   await Future.delayed(const Duration(seconds: 2),(){
  //     AutoRouter.of(context).replace(const LoginRoute());
  //   });
    
  // }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show a dialog or a message.
      _showLocationServicesDisabledDialog();
      return;
    }

    // Check if location permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle it here.
        _showPermissionMessage('Location permission is denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle it here.
      _showPermissionMessage('Location permission is permanently denied. Please enable it from settings.');
      return;
    }

    // If permissions are granted, navigate to the Home Screen
    checkForLogin();
  }

 void _showLocationServicesDisabledDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text("Location Services Disabled"),
          content:const Text("Location services are disabled. Please enable them in your device settings."),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child:const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                // Open device location settings
                Geolocator.openLocationSettings();
                Navigator.of(context).pop();
              },
              child:const Text("Settings"),
            ),
          ],
        );
      },
    );
  }

  void _showPermissionMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.primaryColor,
        child: Center(
            child: Text(
              "Map Apis",
              style: TextStyle(
                  fontSize: 50.0.sp,
                  color: AppColor.bgColor,
              ),
            ),
          ),
      ),
    );
  }
}
