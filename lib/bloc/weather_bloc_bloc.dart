import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_flutter/data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());

      Weather weather = await wf.currentWeatherByLocation(
        event.position.latitude,
        event.position.longitude,
      );

      emit(WeatherBlocSuccess(weather));
    });
    on<FetchWeatherByCity>(
      (event, emit) async {
        emit(WeatherBlocLoading());

        Weather weather = await wf.currentWeatherByCityName(
          event.cityName,
        );

        emit(WeatherBlocSuccess(weather));
      },
    );
  }
}
