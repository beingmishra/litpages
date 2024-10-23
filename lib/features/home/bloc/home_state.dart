part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class DashboardLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String mError;

  const HomeFailure({required this.mError});

  @override
  List<Object> get props => [mError];
}

class DashboardSuccessState extends HomeState {
  final DashboardModel data;
  const DashboardSuccessState(this.data);

  @override
  List<Object> get props => [];
}