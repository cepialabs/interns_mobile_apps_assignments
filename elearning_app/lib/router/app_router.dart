import 'package:go_router/go_router.dart';
import '../models/course_model.dart';
import '../screens/course_detail/cart_screen.dart';
import '../screens/course_detail/course_detail_screen.dart';
import '../screens/course_detail/profile_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/my_course/my_courses_screen.dart';
import 'shell/app_shell.dart';
import '../screens//certificate/certificate_screen.dart';
import '../screens/my_course/my_courses_list_screen.dart';

final GoRouter appRouter = GoRouter(
  // initialLocation: '/login',
  initialLocation: '/',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/certificate/:id',
      builder: (context, state) {
        final courseId = int.parse(state.pathParameters['id']!);

        return CertificateScreen(courseId: courseId);
      },
    ),

    // -------- MAIN APP ROUTES (WITH SHELL) --------
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        // GoRoute(
        //   path: '/explore',
        //   builder: (context, state) => const ExploreScreen(),
        // ),
        GoRoute(
          path: '/my-courses',
          builder: (context, state) => const MyCoursesScreen(),
        ),
        // later:
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/my-courses/list',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            final List<Course> courses = data['courses'];
            final String filter = data['filter'];

            return MyCoursesListScreen(courses: courses, initialFilter: filter);
          },
        ),
        GoRoute(
          path: '/course-details/:courseId',
          builder: (context, state) {
            final id = state.pathParameters['courseId']!;
            return CourseDetailScreen(courseId: id);
          },
          // builder: (context, state) {
          //   final courseId = state.pathParameters['courseId'];
          //   return Scaffold(
          //     body: Center(
          //       child: Text(
          //         'Course Details for ID: $courseId',
          //         style: const TextStyle(fontSize: 18),
          //       ),
          //     ),
          //   );
          // },
        ),

        GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
      ],
    ),
  ],
);
