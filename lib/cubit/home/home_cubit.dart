import 'package:ecommerce_mobile_app/cubit/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> getHomeData() async {
    emit(state.copyWith(isLoading: true));
    try {
      ///
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, apiErrorMessage: e.toString()));
    }
  }
}
