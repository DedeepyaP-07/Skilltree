import 'package:flutter/material.dart';

import '../models.dart';
import 'careers_ai_ops.dart';
import 'careers_dev.dart';
import 'flutter_data.dart';

Career flutterCareer() => Career(
      id: 'flutter',
      title: 'Flutter Developer',
      tagline: 'Build beautiful apps for mobile, web and desktop from a single codebase.',
      icon: Icons.flutter_dash,
      color: const Color(0xFF0175C2),
      stages: flutterStages,
      nodes: flutterNodes,
    );

/// Every career shown on the home screen. Add a new career here.
final List<Career> careers = [
  flutterCareer(),
  frontendCareer(),
  backendCareer(),
  androidCareer(),
  dataScientistCareer(),
  mlEngineerCareer(),
  devopsCareer(),
  cyberCareer(),
  uxCareer(),
];
