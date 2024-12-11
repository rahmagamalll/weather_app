import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is NoWeatherState) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherBody(
            weatherModell: state.weatherModel!,
          ); 
        } else {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.red[300]!, Colors.red[100]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: Text(
                "Oops there is error!! , Write the correct city ☹️..",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          );
        }
      },
    );
  }
}
