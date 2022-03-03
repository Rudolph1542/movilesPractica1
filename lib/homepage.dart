import 'dart:io';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica1/bloc/hora_bloc.dart';

import 'bloc/imagen_bloc.dart';
import 'bloc/frase_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String andorralink = 'https://flagcdn.com/16x12/ad.png';
  String mexicolink = 'https://flagcdn.com/16x12/mx.png';
  String perulink = 'https://flagcdn.com/16x12/pe.png';
  String canadalink = 'https://flagcdn.com/16x12/ca.png';
  String argentinalink = 'https://flagcdn.com/16x12/ar.png';

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text("App frase diaria"),
          actions: const <Widget>[
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ],
        ),
        backLayer: BackdropNavigationBackLayer(
          items: [
            ListTile(
              leading: Image.network(andorralink),
              title: Text('Andorra', style: TextStyle(fontSize: 18)),
              onTap: () {
                BlocProvider.of<HoraBloc>(context).add(
                  HoraEventData(pais: 'Andorra'),
                );
                BlocProvider.of<ImagenBloc>(context).add(
                  ImagenEventData(),
                );
                BlocProvider.of<FraseBloc>(context).add(
                  FraseEventData(),
                );
              },
            ),
            ListTile(
              leading: Image.network(mexicolink),
              title: Text('Mexico', style: TextStyle(fontSize: 18)),
              onTap: () {
                BlocProvider.of<HoraBloc>(context).add(
                  HoraEventData(pais: 'Mexico'),
                );
                BlocProvider.of<ImagenBloc>(context).add(
                  ImagenEventData(),
                );
                BlocProvider.of<FraseBloc>(context).add(
                  FraseEventData(),
                );
              },
            ),
            ListTile(
              leading: Image.network(perulink),
              title: Text('Peru', style: TextStyle(fontSize: 18)),
              onTap: () {
                BlocProvider.of<HoraBloc>(context).add(
                  HoraEventData(pais: 'Peru'),
                );
                BlocProvider.of<ImagenBloc>(context).add(
                  ImagenEventData(),
                );
                BlocProvider.of<FraseBloc>(context).add(
                  FraseEventData(),
                );
              },
            ),
            ListTile(
              leading: Image.network(canadalink),
              title: Text('Canada', style: TextStyle(fontSize: 18)),
              onTap: () {
                BlocProvider.of<HoraBloc>(context).add(
                  HoraEventData(pais: 'Canada'),
                );
                BlocProvider.of<ImagenBloc>(context).add(
                  ImagenEventData(),
                );
                BlocProvider.of<FraseBloc>(context).add(
                  FraseEventData(),
                );
              },
            ),
            ListTile(
              leading: Image.network(argentinalink),
              title: Text('Argentina', style: TextStyle(fontSize: 18)),
              onTap: () {
                BlocProvider.of<HoraBloc>(context).add(
                  HoraEventData(pais: 'Argentina'),
                );
                BlocProvider.of<ImagenBloc>(context).add(
                  ImagenEventData(),
                );
                BlocProvider.of<FraseBloc>(context).add(
                  FraseEventData(),
                );
              },
            )
          ],
        ),
        frontLayer: BlocConsumer<ImagenBloc, ImagenState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ImagenReady) {
              return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(state.imagen),
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.darken))),
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          BlocConsumer<HoraBloc, HoraState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is HoraReady) {
                                return Column(
                                  children: [
                                    Text(
                                      state.hora.substring(11, 19),
                                      style: TextStyle(
                                          fontSize: 55, color: Colors.white),
                                    ),
                                    Text(
                                      state.pais,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                );
                              }
                              if (state is HoraError) {
                                return Text('fail');
                              } else {
                                return Text('CARGANDO');
                              }
                            },
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          BlocConsumer<FraseBloc, FraseState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is FraseReady) {
                                return Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(
                                    '${state.frase}\n\n-${state.autor}',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                );
                              }
                              if (state is FraseError) {
                                return Text(
                                  'fail',
                                  style: TextStyle(color: Colors.white),
                                );
                              } else {
                                return Text(
                                  'CARGANDO',
                                  style: TextStyle(color: Colors.white),
                                );
                              }
                            },
                          ),
                        ],
                      )));
            }
            if (state is ImagenError) {
              return Center(
                child: Text('fail'),
              );
            } else {
              return Center(
                child: Text('CARGANDO'),
              );
            }
          },
        ));
  }
}
