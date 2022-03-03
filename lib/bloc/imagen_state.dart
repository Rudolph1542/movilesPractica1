part of 'imagen_bloc.dart';

abstract class ImagenState extends Equatable {
  const ImagenState();

  @override
  List<Object> get props => [];
}

class ImagenInitial extends ImagenState {}

class ImagenReady extends ImagenState {
  final Uint8List imagen;
  ImagenReady({this.imagen});

  @override
  List<Object> get props => [this.imagen];
}

class ImagenError extends ImagenState {
  String errMsg;
  ImagenError({this.errMsg});
  @override
  List<Object> get props => [this.errMsg];
}
