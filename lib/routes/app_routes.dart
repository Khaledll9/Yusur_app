import 'package:go_router/go_router.dart' show GoRouter, GoRoute;
import 'package:yusur_app/models/course_model.dart';
import 'package:yusur_app/views/add_and_edit/edit_course_view.dart';
import 'package:yusur_app/views/starting_views/course_view/course_details_view.dart';

import '../views/add_and_edit/add_course_view.dart';
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
            builder: (context, state) => const CourseView(),
            routes: [
              GoRoute(
                name: AppRoutes.editCourseView,
                path: '/editCourse',
                builder: (context, state) => const EditCourseView(),
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
