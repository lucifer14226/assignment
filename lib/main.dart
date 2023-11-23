import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/helper/loading/loading_screen.dart';
import 'package:newsapp/services/auth/bloc/auth_bloc.dart';
import 'package:newsapp/services/auth/bloc/auth_event.dart';
import 'package:newsapp/services/auth/bloc/auth_state.dart';
import 'package:newsapp/services/auth/firebase_auth_provider.dart';
import 'package:newsapp/view/forgot_password_view.dart';
import 'package:newsapp/view/home_view.dart';
import 'package:newsapp/view/login_page.dart';
import 'package:newsapp/view/profile_view.dart';
import 'package:newsapp/view/signup_view.dart';
import 'package:newsapp/view/splash_screen.dart';
import 'package:newsapp/view/verify_email_view.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample login page',
      theme: ThemeData(
          primaryColor: const Color(0x0ff3bace),
          scaffoldBackgroundColor: Colors.white),
      home: BlocProvider(
          create: (context) => AuthBloc(FirebaseAuthProvider()),
          child: const SplashScreen()),
      routes: {
        'LoginRoutes': (context) => const LoginPage(),
        'SignupRoutes': (context) => const SignupPage(),
        'VerifyEmailRoutes': (context) => const VerifyEmail(),
        // 'Homepage': (context) => const Homepage(title: ,),
        'ProfileRoutes': (context) => const ProfileView(),
      },
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          debugPrint("I am being called?");
          LoadingScreen().show(
              context: context, text: state.isText ?? 'Please wait moment');
        } else {
          debugPrint("I am being called");
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const Homepage(
            title: 'all',
            date: '23-06-11',
          );
        } else if (state is AuthStateNeedVerification) {
          return const VerifyEmail();
        } else if (state is AuthStateLoggedOut) {
          return const LoginPage();
        } else if (state is AuthStateRegistering) {
          return const SignupPage();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
