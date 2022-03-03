import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/bloc/frase_bloc.dart';
import 'package:practica1/bloc/hora_bloc.dart';
import 'package:practica1/bloc/imagen_bloc.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImagenBloc()..add(ImagenEventData()),
          ),
          BlocProvider(
            create: (context) => FraseBloc()..add(FraseEventData()),
          ),
          BlocProvider(
            create: (context) => HoraBloc()..add(HoraEventData(pais: 'Mexico')),
          )
        ],
        child: HomePage(),
      ),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
