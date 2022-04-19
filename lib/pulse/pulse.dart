import 'package:chart/pulse/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PulseChart {
  Widget getPulse(List<charts.Series<PulseModel, DateTime>> _seriesLineData) {
    return Expanded(
      child: charts.TimeSeriesChart(_seriesLineData,
          defaultRenderer:
              new charts.LineRendererConfig(includeArea: true, stacked: true),
          animate: true,
          animationDuration: Duration(seconds: 5),
          behaviors: [
            new charts.ChartTitle('Years',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
            new charts.ChartTitle('Pulse',
                behaviorPosition: charts.BehaviorPosition.start,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
          ]),
    );
  }
}
