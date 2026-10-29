import 'package:flutter/material.dart';

import '../models.dart';

Course crs(String title, String provider, String duration, [String? url]) =>
    Course(title, provider, duration, url: url);

Course crsPaid(String title, String provider, String duration, [String? url]) =>
    Course(title, provider, duration, url: url, free: false);

SkillNode skill(String id, String title, String description, IconData icon,
        int stage, String? parent, List<Course> courses) =>
    SkillNode(
      id: id,
      title: title,
      description: description,
      icon: icon,
      stage: stage,
      parent: parent,
      courses: courses,
    );

const _palette = [
  Color(0xFF5C6BC0),
  Color(0xFF00897B),
  Color(0xFF1E88E5),
  Color(0xFF8E24AA),
  Color(0xFFF4511E),
  Color(0xFF6D4C41),
];

/// Builds stages from [title, subtitle] pairs, using a shared color palette.
List<Stage> makeStages(List<List<String>> defs) => [
      for (var i = 0; i < defs.length; i++)
        Stage(defs[i][0], defs[i][1], _palette[i % _palette.length]),
    ];
