
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TooltipBehavior? _tooltipBehavior; // dadurch lassen sich Sportarten einklappen


  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) { // hardcoded Werte hab es nicht hinbekommen die Daten von der Datenbank abzurufen
    final List<ChartData> chartData = <ChartData>[
      ChartData ('biking', 3500),
      ChartData ('hiking', 2800),
      ChartData('running', 3400),
      ChartData('swimming', 3200),
      ChartData ('walking', 4000),
      ChartData("working out", 3000),

    ];

    return Scaffold(
        body: Container(
          child: GridView.count(
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            primary: false,
            crossAxisCount: 2, // dadurch werden die Charts nebeneinander angezeigt
            children: <Widget>[
              Card(
                child: SfCircularChart(
                  // Enables the legend
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries<activity, String>>[
                      // Initialize line series
                      PieSeries<activity, String>(  //Kreisdiagramm
                          dataSource: [
                            // Bind data source
                            activity('biking', 3500),
                            activity('hiking', 2800),
                            activity('running', 3400),
                            activity('swimming', 3200),
                            activity('walking', 4000),

                          ],
                          xValueMapper: (activity minutes, _) => minutes.sportart,
                          yValueMapper: (activity minutes, _) => minutes.minutes,
                          name: 'minutes',
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ],
                ),
              ),
              Card(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: true),
                    series: <CartesianSeries>[
                      ColumnSeries<ChartData, String>( //Balkendiagramm
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                        name: "minutes"
    ,dataLabelSettings: DataLabelSettings(isVisible: true)
                      ),

        ]
        )



     )
            ],
          )

        )
    );
  }
}



class activity {
  activity(this.sportart, this.minutes);

  final String sportart;
  final double minutes;
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;

}

