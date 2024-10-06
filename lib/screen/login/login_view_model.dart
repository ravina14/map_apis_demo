part of 'login_imports.dart';

class LoginViewModel {

VelocityBloc<bool> googleLoginBloc = VelocityBloc<bool>(false);

  Future<void> loginWithGoogle(BuildContext context) async {
    showLoading(context);
    try {
      final userCredential = await GoogleAuthService.shared.signinWithGoogle();
      hideLoading(context);
      if (userCredential.user != null) {
          debugPrint("Error during Google login: ${userCredential.user!.displayName}");
          googleLoginBloc.onUpdateData(true);
      } else {
        googleLoginBloc.onUpdateData(false);
      }
    } catch (e) {
      hideLoading(context);
        // Handle exceptions and log error if needed
        debugPrint("Error during Google login: $e");
        googleLoginBloc.onUpdateData(false);
        VxToast.show(context, msg: "Error during Google login: $e");
    }
  }
  
}