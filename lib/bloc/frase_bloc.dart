import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

part 'frase_event.dart';
part 'frase_state.dart';

class FraseBloc extends Bloc<FraseEvent, FraseState> {
  FraseBloc() : super(FraseInitial()) {
    on<FraseEvent>(loadFrase);
  }

  void loadFrase(FraseEvent event, Emitter emitter) async {
    var frase = await getFrase();
    if (frase != null) {
      emitter(FraseReady(frase: frase[0]['q'], autor: frase[0]['a']));
    } else {
      emitter(FraseError());
    }
  }

  String url = 'https://zenquotes.io/api/random';
  Future getFrase() async {
    try {
      final http.Response res = await http.get(Uri.parse(url));
      print(res.body);
      if (res.statusCode == HttpStatus.ok) {
        return jsonDecode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
