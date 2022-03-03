part of 'hora_bloc.dart';

abstract class HoraState extends Equatable {
  const HoraState();

  @override
  List<Object> get props => [];
}

class HoraInitial extends HoraState {}

class HoraReady extends HoraState {
  final String hora;
  final String pais;
  HoraReady({this.hora, this.pais});
  @override
  List<Object> get props => [this.hora, this.pais];
}

class HoraError extends HoraState {
  String errMsg;
  HoraError({this.errMsg});
  @override
  List<Object> get props => [this.errMsg];
}
