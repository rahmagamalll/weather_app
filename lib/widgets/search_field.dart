import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
      
        child: BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            return TextField(
              onSubmitted: (value) async {
         

                BlocProvider.of<WeatherCubit>(context).getWeather(value);

                Navigator.of(context).pop();
                log(value);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                label: Text(
                  'search',
                  style: TextStyle(
                    color: getColorCondition(
                        BlocProvider.of<WeatherCubit>(context)
                            .weatherModel
                            ?.condition),
                  ),
                ),
                hintText: 'Enter City Name',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: getColorCondition(
                          BlocProvider.of<WeatherCubit>(context)
                              .weatherModel
                              ?.condition)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
