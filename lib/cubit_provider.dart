// lib/core/cubit_providers.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yusur_app/view_models/course_cubit/course_test_cubit.dart';

import 'locator.dart';

class CubitProviders extends StatelessWidget {
  final Widget child;

  const CubitProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseTestCubit>(
          create: (_) => locator<CourseTestCubit>(),
        ),
      ],
      child: child,
    );
  }
}
