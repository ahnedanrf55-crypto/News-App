import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/api_response_model.dart';
import 'package:news_app/view/widgets/api_response.dart';
import 'package:news_app/view/widgets/api_result.dart';
import 'package:news_app/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  Future<void> getHomeData() async {
    emit(LoadingState());
    final result = await ApiResponse.apiResponse();
    switch (result) {
      case ApiSuccess<ApiResponseModel>():
        emit(SuccessState(result.data?.articles ?? []));
      case ApiError<ApiResponseModel>():
        emit(ErrorState(result.message));
    }
  }
}
