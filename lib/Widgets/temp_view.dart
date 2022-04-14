import 'package:flutter/material.dart';
import 'package:serializable_fl01/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList![0].temp.day.toStringAsFixed(0);
    var description = forecastList![0].weather[0].description.toUpperCase() ;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon),
          SizedBox(width: 20.0,),
          Column(
            children: [
              Text('$temp ℃', style:
                TextStyle(fontSize: 28.0, color: Colors.black87),
              ),
              Text('$description', style:
                TextStyle(fontSize: 18.0, color: Colors.black87),
              )
            ],
          )
        ],
      ),
    );
  }
}
