import 'package:news_app/model/api_response_model.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  final List<Articles> articles;

  SuccessState(this.articles);
}

class ErrorState extends HomeState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}