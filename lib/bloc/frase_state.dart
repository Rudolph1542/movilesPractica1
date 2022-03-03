part of 'frase_bloc.dart';

abstract class FraseState extends Equatable {
  const FraseState();

  @override
  List<Object> get props => [];
}

class FraseInitial extends FraseState {}

class FraseReady extends FraseState {
  final String frase;
  final String autor;
  FraseReady({this.frase, this.autor});
  @override
  List<Object> get props => [this.frase, this.autor];
}

class FraseError extends FraseState {
  String errMsg;
  FraseError({this.errMsg});
  @override
  List<Object> get props => [this.errMsg];
}
