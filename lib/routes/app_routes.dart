import 'package:go_router/go_router.dart' show GoRouter, GoRoute;
import 'package:yusur_app/models/course_model.dart';
import 'package:yusur_app/models/institute_model.dart';
import 'package:yusur_app/views/add_and_edit/edit_course_view.dart';
import 'package:yusur_app/views/starting_views/course_view/course_details_view.dart';

import '../views/starting_views/course_view/course_view.dart';
import '../views/starting_views/home_view.dart';

class AppRouter {
  AppRouter._();
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.homeView,
        path: '/',
        builder: (context, state) => const HomeView(),

        routes: [
          GoRoute(
            name: AppRoutes.courseView,
            path: '/course',
            builder: (context, state) =>
                CourseView(institute: state.extra as Institute),
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
}

class AppRoutes {
  AppRoutes._();
  static const String homeView = 'home';
  static const String courseView = 'course';
  static const String editCourseView = 'editCourse';
  static const String courseDetailView = 'courseDetail';
}
