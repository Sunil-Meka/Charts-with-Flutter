import 'package:chart/pulse/model.dart';
import 'package:chart/pulse/pulse.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PulseTest extends StatefulWidget {
  const PulseTest({Key? key}) : super(key: key);

  @override
  State<PulseTest> createState() => _PulseTestState();
}

class _PulseTestState extends State<PulseTest> {
  late List<charts.Series<PulseModel, DateTime>> _seriesLineData;

  _generateData() {
    var linesalesdata = [
      new PulseModel(DateTime(2019, 04, 18), 45),
      new PulseModel(DateTime(2019, 06, 10), 56),
      new PulseModel(DateTime(2019, 08, 25), 55),
      new PulseModel(DateTime(2019, 09, 19), 60),
      new PulseModel(DateTime(2019, 10, 14), 61),
      new PulseModel(DateTime(2019, 12, 13), 70),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Patients pulse',
        data: linesalesdata,
        domainFn: (PulseModel pulse, _) => pulse.yearval,
        measureFn: (PulseModel pulse, _) => pulse.pulseval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = <charts.Series<PulseModel, DateTime>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("pulse"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Pulse data',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              PulseChart().getPulse(_seriesLineData)
            ],
          ),
        ));
  }
}
