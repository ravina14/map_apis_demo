part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final LoginViewModel loginViewModel;
  @override
  void initState() {
    loginViewModel = LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VelocityBloc, VelocityState>(
      bloc: loginViewModel.googleLoginBloc,
      builder: (context, state) {
        if(state is VelocityUpdateState){
          if(state.data){
             AutoRouter.of(context).push(const PlaceListRoute());
          }
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.googleIcon,
                height: 100.h,
                width: 100.h,
              ),
              CustomButton(
                  title: "Google Login",
                  onPressed: () => {
                        loginViewModel.loginWithGoogle(),
                      }).centered().p(50.0.r),
            ],
          ).centered(),
        );
      },
    );
  }
}
