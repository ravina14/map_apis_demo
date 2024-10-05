import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_apis_demo/data/api_exception.dart';
import 'package:map_apis_demo/data/models/place_model.dart';
import 'package:map_apis_demo/data/repository/repository.dart';
import 'package:map_apis_demo/router/router_imports.gr.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import '../../custom_widget/custom_widget_imports.dart';
import '../../data/models/location_model.dart';
import '../../helper/location_manager.dart';
import '../../helper/utility.dart';

part 'place_list.dart';
part 'place_list_view_model.dart';