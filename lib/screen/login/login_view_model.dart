part of 'login_imports.dart';

class LoginViewModel {

VelocityBloc<bool> googleLoginBloc = VelocityBloc<bool>(false);

  Future<void> loginWithGoogle() async {
    try {
      final userCredential = await GoogleAuthService.shared.signinWithGoogle();
      if (userCredential.user != null) {
         debugPrint("Error during Google login: ${userCredential.user!.displayName}");
        googleLoginBloc.onUpdateData(true);
      } else {
        googleLoginBloc.onUpdateData(false);
      }
    } catch (e) {
      // Handle exceptions and log error if needed
      debugPrint("Error during Google login: $e");
      googleLoginBloc.onUpdateData(false);
    }
  }
  
}