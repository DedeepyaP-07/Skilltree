import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

/// Keeps track of completed courses for every career and saves them on the device.
class ProgressStore extends ChangeNotifier {
  ProgressStore._(this._prefs, this._done);

  static const _key = 'done_courses';
  final SharedPreferences _prefs;
  final Set<String> _done;

  static Future<ProgressStore> load() async {
    final prefs = await SharedPreferences.getInstance();
    return ProgressStore._(prefs, (prefs.getStringList(_key) ?? []).toSet());
  }

  Future<void> _save() => _prefs.setStringList(_key, _done.toList());

  bool isDone(String courseId) => _done.contains(courseId);

  Future<void> toggle(String courseId) async {
    _done.contains(courseId) ? _done.remove(courseId) : _done.add(courseId);
    notifyListeners();
    await _save();
  }

  Future<void> resetCareer(Career career) async {
    for (final n in career.nodes) {
      for (var i = 0; i < n.courses.length; i++) {
        _done.remove(n.courseId(i));
      }
    }
    notifyListeners();
    await _save();
  }

  int doneIn(SkillNode node) {
    var count = 0;
    for (var i = 0; i < node.courses.length; i++) {
      if (_done.contains(node.courseId(i))) count++;
    }
    return count;
  }

  double progressOf(SkillNode node) => doneIn(node) / node.courses.length;

  bool isComplete(SkillNode node) => doneIn(node) == node.courses.length;

  /// A skill opens once the skill it branches from is at least half finished.
  bool isUnlocked(Career career, SkillNode node) =>
      node.parent == null || progressOf(career.byId[node.parent!]!) >= 0.5;

  int careerDone(Career c) => c.nodes.fold(0, (s, n) => s + doneIn(n));

  double careerProgress(Career c) => careerDone(c) / c.totalCourses;

  int skillsComplete(Career c) => c.nodes.where(isComplete).length;
}
