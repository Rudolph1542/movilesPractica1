import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

part 'hora_event.dart';
part 'hora_state.dart';

class HoraBloc extends Bloc<HoraEvent, HoraState> {
  HoraBloc() : super(HoraInitial()) {
    on<HoraEventData>(loadHora);
  }
  var hpaises = {
    'Andorra': 'http://worldtimeapi.org/api/timezone/Europe/Andorra',
    'Mexico': 'http://worldtimeapi.org/api/timezone/America/Mexico_City',
    'Peru': 'http://worldtimeapi.org/api/timezone/America/Lima',
    'Canada': 'http://worldtimeapi.org/api/timezone/America/Toronto',
    'Argentina': 'http://worldtimeapi.org/api/timezone/America/Argentina/Salta'
  };

  void loadHora(HoraEventData event, Emitter emitter) async {
    var hora = await getHora(event.pais);
    if (hora != null) {
      emitter(HoraReady(hora: hora['datetime'], pais: event.pais));
    } else {
      emitter(HoraError());
    }
  }

  Future getHora(String pais) async {
    try {
      String url = hpaises[pais];
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
