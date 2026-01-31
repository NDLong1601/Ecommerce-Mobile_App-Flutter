import 'package:ecommerce_mobile_app/cubit/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      ///
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, apiErrorMessage: e.toString()));
    }
  }
}
