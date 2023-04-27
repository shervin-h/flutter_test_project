part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoadingState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashCompletedState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashErrorState extends SplashState {
  final String errorMessage;
  SplashErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
