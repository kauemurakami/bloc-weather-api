import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/blocs/blocs.dart';
import 'package:weather_bloc/repositories/repositories.dart';
import 'package:weather_bloc/simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/widgets/widgets.dart';

void main() {
 final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: App(weatherRepository: weatherRepository),
    ),
  );
}
