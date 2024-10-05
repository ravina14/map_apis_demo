import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:map_apis_demo/data/repository/place_repo.dart';

import 'constant/themes/app_themes.dart';
import 'data/repository/repository.dart';
import 'router/router_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (GetPlatform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC3DBtuBo5lMpB3E7rtmuBPozgA7b3dFwI",
            appId: "1015013093320",
            messagingSenderId: "1015013093320",
            projectId: "mapapisdemo-6c324"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    RepositoryProvider(
    create: (context) => Repository(placeRepo: PlaceRepo()),
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize: const Size(428, 926),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (context, child) {
            return MaterialApp.router(
              title: "Map Apis",
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              routerConfig: _appRouter.config(),
            );
          }
        );
  }
}