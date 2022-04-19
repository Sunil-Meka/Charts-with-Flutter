import 'package:chart/spo2/model.dart';
import 'package:chart/spo2/spo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Spo2Test extends StatefulWidget {
  const Spo2Test({Key? key}) : super(key: key);

  @override
  State<Spo2Test> createState() => _Spo2TestState();
}

class _Spo2TestState extends State<Spo2Test> {
  late List<charts.Series<Spo2Model, String>> _seriesPieData;

  _generateData() {
    var piedata = [
      new Spo2Model('LOWEST', 35, Color(0xff3366cc)),
      new Spo2Model('HIGHEST', 15, Color(0xff990099)),
      new Spo2Model('MEDIAN', 30, Color(0xff109618)),
      new Spo2Model('AVERAGE', 20, Color(0xfffdbe19)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Spo2Model spo2, _) => spo2.type,
        measureFn: (Spo2Model spo2, _) => spo2.spo2Value,
        colorFn: (Spo2Model spo2, _) =>
            charts.ColorUtil.fromDartColor(spo2.colorval),
        id: 'spo2 data',
        data: piedata,
        labelAccessorFn: (Spo2Model row, _) => '${row.spo2Value}',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<Spo2Model, String>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Spo2")),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Spo2 data',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Spo2Chart().getSpo2(_seriesPieData)
            ],
          ),
        ));
  }
}
