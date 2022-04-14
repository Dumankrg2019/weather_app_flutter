
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:serializable_fl01/Widgets/bottom_list_view.dart';
import 'package:serializable_fl01/Widgets/city_view.dart';
import 'package:serializable_fl01/Widgets/detail_view.dart';
import 'package:serializable_fl01/Widgets/temp_view.dart';
import 'package:serializable_fl01/models/weather_forecast_daily.dart';
import 'package:serializable_fl01/screens/city_screen.dart';
import 'package:serializable_fl01/weather_api.dart';

class WeatherForecastScreen extends StatefulWidget {

  @override
  _WeatherForecastScreen createState() => _WeatherForecastScreen();
}

class _WeatherForecastScreen extends State<WeatherForecastScreen> {

  late Future <WeatherForecast> forecastObject;
  String _cityName = 'karaganda';

  @override
  void initState() {
    super.initState();

    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    // forecastObject.then(  (weather) {
    //     print(weather.list![0].weather[0].main);
    //   }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () { },
        ),
        actions: [
          IconButton(
              onPressed: () async {
               var tappedName =  await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CityScreen();
                    })
                );
               if(tappedName != null) {
                 setState(() {
                   _cityName = tappedName;
                   forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);
                 });
               }
              },
              icon: Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50.0,),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 20,),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50,),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50,),
                      BottomListView(snapshot: snapshot)
                    ],
                  );
                } else {
                  return Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black87,
                      size: 100.0,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
