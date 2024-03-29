
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/services/auth/auth_provider.dart';
import 'package:newsapp/services/auth/bloc/auth_event.dart';
import 'package:newsapp/services/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProviders provider)
      : super(const AuthStateUninitialized(isLoading: true)) {
    //sendEmailVerifications

    on<AuthEventSendVerfication>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    //forgot pAssword
    on<AuthEventForgotPassword>((event, emit) async {
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: false,
      ));

      final email = event.email;
      if (email == null) {
        return; //user want to got to forgotpassword screen
      }

      //user wants to actually send a forgot-password email
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: true,
      ));

      bool didSendEmail;
      Exception? exception;

      try {
        await provider.sendPasswordResent(toEmail: email);
        didSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        didSendEmail = false;
        exception = e;
      }

      emit(AuthStateForgotPassword(
        exception: exception,
        hasSentEmail: didSendEmail,
        isLoading: false,
      ));
    });
    //Initalize
    on<AuthEventInitialize>((event, emit) async {
      await provider.initalize();
      final user = provider.currentUser;
      if (user == null) {
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: false,
            loadingText: null,
          ),
        );
      } else if (!user.isEmailVerified) {
        emit(const AuthStateNeedVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    });

    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(exception: null, isLoading: false));
    });

    //Register
    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        await provider.createUser(email: email, password: password);
        await provider.sendEmailVerification();
        emit(const AuthStateNeedVerification(
          isLoading: false,
        ));
      } on Exception catch (e) {
        emit(AuthStateRegistering(
          exception: e,
          isLoading: false,
        ));
      }
    });
    //login
    on<AuthEventLogin>((event, emit) async {
      emit(
        const AuthStateLoggedOut(
          exception: null,
          isLoading: true,
          loadingText: 'Please Wait till I log in',
        ),
      );
      final email = event.email;
      final password = event.password;

      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );
        if (!user.isEmailVerified) {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
              loadingText: null,
            ),
          );
          emit(const AuthStateNeedVerification(isLoading: false));
        } else {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
              loadingText: null,
            ),
          );
        }
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      } on Exception catch (e) {
        emit(
          AuthStateLoggedOut(
            exception: e,
            isLoading: false,
            loadingText: 'null',
          ),
        );
      }
    });

    //logout
    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logOut();
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: false,
            loadingText: null,
          ),
        );
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(
          exception: e,
          isLoading: false,
          loadingText: null,
        ));
      }
    });
  }
}
