import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/ui/pages/widgets/segment_options.dart';

class SegmentDetail extends StatefulWidget {
  const SegmentDetail({super.key});

  @override
  State<SegmentDetail> createState() => _SegmentDetailState();
}

class _SegmentDetailState extends State<SegmentDetail> {
  String _selectedSegment = "stats";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.white,
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: CupertinoSegmentedControl(
            selectedColor: Colors.redAccent,
            borderColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            groupValue: _selectedSegment,
            onValueChanged: (String value) {
              setState(() {
                _selectedSegment = value;
              });
            },
            children: const <String, Widget>{
              "stats": Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Stats',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              "attacks": Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Attacks',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              "curiosities": Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Curiosities',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            },
          ),
        ),
        child: Center(
          child: SegmentOptions(value: _selectedSegment),
        ));
  }
}
