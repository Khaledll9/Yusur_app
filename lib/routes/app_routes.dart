import 'package:go_router/go_router.dart' show GoRouter, GoRoute;
import 'package:yusur_app/models/course_model.dart';
import 'package:yusur_app/onboarding/screens/onboarding_screen.dart';
import 'package:yusur_app/views/Authentication/screens/login_view.dart';
import 'package:yusur_app/views/Authentication/screens/register_view.dart';
import 'package:yusur_app/views/add_and_edit/edit_course_view.dart';
import 'package:yusur_app/views/choose_course_type/choose_course_view.dart';
import 'package:yusur_app/views/starting_views/course_view/course_details_view.dart';
import 'package:yusur_app/views/starting_views/drawer_view.dart';

import '../views/add_and_edit/add_course_view.dart';
import '../views/add_and_edit/add_diploma_view.dart';
import '../views/starting_views/course_view/course_view.dart';
import '../views/starting_views/home_view.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.onBoardingView,
        path: '/',
        builder: (context, state) => const DrawerView(),
      ),
      GoRoute(
        name: AppRoutes.loginView,
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: AppRoutes.registerView,
        path: '/register',
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        name: AppRoutes.homeView,
        path: '/home',
        builder: (context, state) => const HomeView(),

        routes: [
          GoRoute(
            name: AppRoutes.chooseCourseTypeView,
            path: '/chooseCourseType',
            builder: (context, state) =>
                const ChooseCourseTypeView(isStudent: false),
            routes: [
              GoRoute(
                name: AppRoutes.addCourseView,
                path: '/addCourse',
                builder: (context, state) => const AddCourseView(),
              ),
              GoRoute(
                name: AppRoutes.addDiplomaView,
                path: '/addDiploma',
                builder: (context, state) => const AddDiplomaView(),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.courseView,
            path: '/course',
            builder: (context, state) => const CourseView(),
            routes: [
              GoRoute(
                name: AppRoutes.editCourseView,
                path: '/editCourse',
                builder: (context, state) =>
                    EditCourseView(course: state.extra as Course),
              ),
              GoRoute(
                name: AppRoutes.courseDetailView,
                path: '/courseDetail',
                builder: (context, state) =>
                    CourseDetailsView(course: state.extra as Course),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  AppRouter._();
}

class AppRoutes {
  static const String onBoardingView = 'onBoarding';
  static const String loginView = 'login';
  static const String registerView = 'register';
  static const String homeView = 'home';
  static const String courseView = 'course';
  static const String editCourseView = 'editCourse';
  static const String courseDetailView = 'courseDetail';
  static const String chooseCourseTypeView = 'chooseCourseType';
  static const String addCourseView = 'addCourse';
  static const String addDiplomaView = 'addDiploma';
  AppRoutes._();
}
