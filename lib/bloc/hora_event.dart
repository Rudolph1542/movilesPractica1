part of 'hora_bloc.dart';

abstract class HoraEvent extends Equatable {
  const HoraEvent();
  @override
  List<Object> get props => [];
}

class HoraEventData extends HoraEvent {
  String pais;
  HoraEventData({this.pais});
  @override
  List<Object> get props => [this.pais];
}
