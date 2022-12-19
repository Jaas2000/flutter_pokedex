import 'package:flutter/material.dart';
import 'package:pokedex/ui/pages/widgets/attack_segment.dart';
import 'package:pokedex/ui/pages/widgets/curiosities_segment.dart';
import 'package:pokedex/ui/pages/widgets/stats_segment.dart';

class SegmentOptions extends StatefulWidget {
  final String value;
  const SegmentOptions({super.key, required this.value});

  @override
  State<SegmentOptions> createState() => _SegmentOptionsState();
}

class _SegmentOptionsState extends State<SegmentOptions> {
  @override
  Widget build(BuildContext context) {
    if (widget.value == "stats") {
      return const StatsSegment();
    } else if (widget.value == "attacks") {
      return const AttackSegment();
    } else {
      return const CuriositiesSegment();
    }
  }
}
