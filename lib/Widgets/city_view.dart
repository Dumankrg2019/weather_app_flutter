import 'package:flutter/material.dart';
import 'package:serializable_fl01/models/weather_forecast_daily.dart';
import 'package:serializable_fl01/utils/forecast_util.dart';

class CityView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city.name;
    var country = snapshot.data!.city.country;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Container(
      child: Column(
        children: [
          Text('$city, $country',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 28.0)
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}',
            style: TextStyle(
                fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
