import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'model.dart';

class Spo2Chart {
  Widget getSpo2(List<charts.Series<Spo2Model, String>> _seriesPieData) {
    return Expanded(
      child: charts.PieChart(_seriesPieData,
          animate: true,
          animationDuration: Duration(seconds: 5),
          behaviors: [
            new charts.DatumLegend(
              outsideJustification: charts.OutsideJustification.endDrawArea,
              horizontalFirst: false,
              desiredMaxRows: 2,
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              entryTextStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.purple.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 11),
            )
          ],
          defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 100,
              arcRendererDecorators: [
                new charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.inside)
              ])),
    );
  }
}
