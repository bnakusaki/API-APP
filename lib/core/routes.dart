import 'package:go_router/go_router.dart';
import '../screens/authentication/signIn.dart';
import '../screens/authentication/signUp.dart';
import '../screens/home.dart';
import '../screens/welcome/newIntroScreen.dart';
import '../screens/welcome/welcome.dart';

////////////////////////////////////////////////////////////////////////////////

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const WelcomeScreen(),
  ),
  GoRoute(
    path: '/introScreen',
    builder: (context, state) => const NewIntroScreen(),
  ),
  GoRoute(
    path: '/signUpScreen',
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: '/signInScreen',
    builder: (context, state) => const SignInScreen(),
  ),
  GoRoute(
    path: '/homeScreen',
    builder: (context, state) => const HomeScreen(),
  ),
]);
