import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/home_view.dart';
import 'cubits/get_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_weather_cubit/get_weather_states.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherCubit>(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, WeatherState>(

              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                    primarySwatch: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  ),
                  home: const HomeView(),
                );
              },
            ),
      ),
    );
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Heavy snow') {
      return Colors.lightBlue;
    } else {
      return Colors.blue;
    }
  }
}