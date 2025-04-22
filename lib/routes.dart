import 'package:go_router/go_router.dart';
import 'signup.dart';
import 'login.dart';
import 'home.dart';
import 'reading.dart';
import 'education.dart';
import 'about.dart';

// Navigation setup
final GoRouter router = GoRouter(
  initialLocation: '/signup', // Start at signup screen
  routes: [
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/reading',
      builder: (context, state) => const UVReadingScreen(),
    ),
    GoRoute(
      path: '/education',
      builder: (context, state) => const UVEducationScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutUsScreen(),
    ),
  ],
);