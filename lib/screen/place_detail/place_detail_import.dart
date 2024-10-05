import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_apis_demo/helper/utility.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import '../../custom_widget/custom_widget_imports.dart';
import '../../data/api_exception.dart';
import '../../data/models/place_distance_matrix.dart';
import '../../data/models/place_model.dart';
import '../../data/repository/repository.dart';



part 'place_detail.dart';
part 'place_detail_view_model.dart';
