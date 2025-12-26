// lib/core/cubit_providers.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator.dart';
import 'view_models/course_cubit/course_cubit.dart';
import 'view_models/institute_cubit/institute_cubit.dart';

class CubitProviders extends StatelessWidget {
  final Widget child;

  const CubitProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InstituteCubit>(
          create: (context) => locator<InstituteCubit>(),
        ),
        BlocProvider<CourseCubit>(create: (context) => locator<CourseCubit>()),
      ],
      child: child,
    );
  }
}
