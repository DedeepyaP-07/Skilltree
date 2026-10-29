import 'package:flutter/material.dart';

class Course {
  const Course(
    this.title,
    this.provider,
    this.duration, {
    this.url,
    this.free = true,
  });

  final String title;
  final String provider;
  final String duration;
  final String? url;
  final bool free;

  /// Direct link if we have one, otherwise a search for the course.
  Uri get link => Uri.parse(
        url ??
            'https://www.google.com/search?q=${Uri.encodeComponent('$title $provider')}',
      );
}

class Stage {
  const Stage(this.title, this.subtitle, this.color);
  final String title;
  final String subtitle;
  final Color color;
}

class SkillNode {
  const SkillNode({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.stage,
    required this.courses,
    this.parent,
  });

  final String id;
  final String title;
  final String description;
  final IconData icon;
  final int stage;

  /// The skill this one branches from. null means it branches from the root.
  final String? parent;
  final List<Course> courses;

  String courseId(int index) => '$id:$index';
}

/// A job or role with its own skill tree.
class Career {
  Career({
    required this.id,
    required this.title,
    required this.tagline,
    required this.icon,
    required this.color,
    required this.stages,
    required this.nodes,
  });

  final String id;
  final String title;
  final String tagline;
  final IconData icon;
  final Color color;
  final List<Stage> stages;
  final List<SkillNode> nodes;

  late final Map<String, SkillNode> byId = {for (final n in nodes) n.id: n};

  late final int totalCourses = nodes.fold(0, (sum, n) => sum + n.courses.length);

  late final Map<String?, List<SkillNode>> children = () {
    final m = <String?, List<SkillNode>>{};
    for (final n in nodes) {
      (m[n.parent] ??= []).add(n);
    }
    return m;
  }();

  Color stageColor(SkillNode n) => stages[n.stage].color;
}
