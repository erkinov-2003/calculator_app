part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeCubitState {
  final String countNumber;
  final String answerNumber;

  HomeSuccessState({required this.countNumber, required this.answerNumber});

  @override
  List<Object> get props => [countNumber, answerNumber];
}

class HomeLoadingState extends HomeCubitState {}