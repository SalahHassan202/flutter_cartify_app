import 'package:cartify_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.length >= 6) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Invalid credentials"));
    }
  }

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (name.isNotEmpty &&
        phone.length == 11 &&
        email.contains("@") &&
        password.length >= 6) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Invalid registration data"));
    }
  }
}
