import 'package:newsapp/services/auth/auth_user.dart';

abstract class AuthProviders {
  Future<void> initalize();
  AuthUser? get currentUser;
  Future<AuthUser> logIn({required String email, required String password});
  Future<AuthUser> createUser(
      {required String email, required String password});

  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordResent({required String toEmail});
}
