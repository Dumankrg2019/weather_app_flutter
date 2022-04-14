
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serializable_fl01/utils/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
    var forecastList = snapshot.data.list;
    var dayOfWeek = '';
    DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
    var fullDate = Util.getFormattedDate(date);
    dayOfWeek = fullDate.split(',')[0]; // Tue
    var tempMin  = forecastList[index].temp.min.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              dayOfWeek,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('$tempMin ℃',
                        style: TextStyle(fontSize: 24,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Image.network(icon, color: Colors.white,)
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
}