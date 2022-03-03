import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

part 'imagen_event.dart';
part 'imagen_state.dart';

class ImagenBloc extends Bloc<ImagenEvent, ImagenState> {
  ImagenBloc() : super(ImagenInitial()) {
    on<ImagenEvent>(loadImagen);
  }

  void loadImagen(ImagenEvent event, Emitter emit) async {
    var loadimagen = await getImagen();
    if (loadimagen != null) {
      emit(ImagenReady(imagen: loadimagen));
    } else {
      emit(ImagenError());
    }
  }

  Future getImagen() async {
    Random random = Random();
    int random1 = random.nextInt(500);
    String url = 'https://picsum.photos/seed/${random1}1200/800';
    try {
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == HttpStatus.ok) {
        return res.bodyBytes;
      }
    } catch (e) {
      print(e);
    }
  }
}
