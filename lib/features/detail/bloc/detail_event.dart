part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchBookDetailEvent extends DetailEvent {
  final String key;
  const FetchBookDetailEvent(this.key);

  @override
  List<Object> get props => [key];
}
