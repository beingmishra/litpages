part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailFailure extends DetailState {
  final String mError;

  const DetailFailure({required this.mError});

  @override
  List<Object> get props => [mError];
}

class FetchDetailSuccessState extends DetailState {
  final BookDetailModel? data;
  const FetchDetailSuccessState(this.data);

  @override
  List<Object> get props => [];
}