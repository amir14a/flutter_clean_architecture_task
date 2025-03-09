import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_task/common/di/app_service_locator.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/cubit/user_details_page_cubit.dart';
import 'package:flutter_clean_architecture_task/feature_modules/user_details/presentation/page/user_details_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter clean architecture task by AmirAbbas Jannatian',
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      }),
      home: BlocProvider<UserDetailsPageCubit>(
        create: (_) => getIt()..fetchUserDetails(),
        child: const UserDetailsPage(),
      ),
    );
  }
}
