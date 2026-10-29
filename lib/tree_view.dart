import 'package:flutter/material.dart';

import 'models.dart';
import 'progress_store.dart';

const double _nodeW = 150, _nodeH = 78, _gapX = 54, _gapY = 16, _pad = 32, _legendH = 56;

/// A tidy left-to-right tree: leaves are stacked top to bottom, and every
/// parent sits vertically centered beside its children.
class TreeLayout {
  TreeLayout._(Career career) {
    var nextY = _legendH + _pad;
    var maxDepth = 0;

    double place(SkillNode n, int depth) {
      if (depth > maxDepth) maxDepth = depth;
      final kids = career.children[n.id] ?? const <SkillNode>[];
      double y;
      if (kids.isEmpty) {
        y = nextY;
        nextY += _nodeH + _gapY;
      } else {
        final ys = [for (final k in kids) place(k, depth + 1)];
        y = (ys.first + ys.last) / 2;
      }
      pos[n.id] = Offset(_pad + depth * (_nodeW + _gapX), y);
      return y;
    }

    final tops = [for (final r in career.children[null]!) place(r, 1)];
    rootPos = Offset(_pad, (tops.first + tops.last) / 2);
    width = _pad * 2 + (maxDepth + 1) * _nodeW + maxDepth * _gapX;
    height = nextY - _gapY + _pad;
  }

  static final Map<String, TreeLayout> _cache = {};
  static TreeLayout of(Career c) => _cache.putIfAbsent(c.id, () => TreeLayout._(c));

  final Map<String, Offset> pos = {};
  late final Offset rootPos;
  late final double width;
  late final double height;
}

class SkillTreeView extends StatefulWidget {
  const SkillTreeView({
    super.key,
    required this.career,
    required this.store,
    required this.onTap,
    this.selectedId,
  });

  final Career career;
  final ProgressStore store;
  final String? selectedId;
  final void Function(SkillNode node, Color color) onTap;

  @override
  State<SkillTreeView> createState() => _SkillTreeViewState();
}

class _SkillTreeViewState extends State<SkillTreeView> {
  final _controller = TransformationController();
  bool _inited = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final career = widget.career;
    final layout = TreeLayout.of(career);

    return LayoutBuilder(builder: (context, c) {
      if (!_inited) {
        // Start with the root in view, vertically centered.
        const s = 0.8;
        final ty = c.maxHeight / 2 - (layout.rootPos.dy + _nodeH / 2) * s;
        _controller.value = Matrix4.translationValues(0, ty, 0)
          ..multiply(Matrix4.diagonal3Values(s, s, 1));
        _inited = true;
      }
      return InteractiveViewer(
        transformationController: _controller,
        constrained: false,
        minScale: 0.25,
        maxScale: 2.5,
        boundaryMargin: const EdgeInsets.all(300),
        child: SizedBox(
          width: layout.width,
          height: layout.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _EdgePainter(career, layout, widget.store)),
              ),
              Positioned(
                left: _pad,
                top: 12,
                right: _pad,
                child: Wrap(
                  spacing: 14,
                  runSpacing: 4,
                  children: [
                    for (final s in career.stages)
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(color: s.color, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 5),
                        Text(s.title, style: const TextStyle(fontSize: 12)),
                      ]),
                  ],
                ),
              ),
              Positioned(
                left: layout.rootPos.dx,
                top: layout.rootPos.dy,
                width: _nodeW,
                height: _nodeH,
                child: _RootNode(career: career, store: widget.store),
              ),
              for (final n in career.nodes)
                Positioned(
                  left: layout.pos[n.id]!.dx,
                  top: layout.pos[n.id]!.dy,
                  width: _nodeW,
                  height: _nodeH,
                  child: _TreeNode(
                    career: career,
                    node: n,
                    store: widget.store,
                    selected: n.id == widget.selectedId,
                    onTap: widget.onTap,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

class _EdgePainter extends CustomPainter {
  _EdgePainter(this.career, this.layout, this.store);
  final Career career;
  final TreeLayout layout;
  final ProgressStore store;

  @override
  void paint(Canvas canvas, Size size) {
    for (final child in career.nodes) {
      final Offset from;
      final bool reached;
      final Color color;
      if (child.parent == null) {
        from = layout.rootPos;
        reached = true;
        color = career.color;
      } else {
        final parent = career.byId[child.parent!]!;
        from = layout.pos[parent.id]!;
        reached = store.progressOf(parent) >= 0.5;
        color = reached ? career.stageColor(parent) : Colors.grey.withOpacity(0.55);
      }
      final to = layout.pos[child.id]!;
      final start = Offset(from.dx + _nodeW, from.dy + _nodeH / 2);
      final end = Offset(to.dx, to.dy + _nodeH / 2);
      final mid = (end.dx - start.dx) / 2;
      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..cubicTo(start.dx + mid, start.dy, end.dx - mid, end.dy, end.dx, end.dy);
      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = reached ? 2.5 : 1.5
          ..color = color,
      );
      canvas.drawCircle(end, 3.5, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant _EdgePainter old) => true;
}

class _RootNode extends StatelessWidget {
  const _RootNode({required this.career, required this.store});
  final Career career;
  final ProgressStore store;

  @override
  Widget build(BuildContext context) {
    const fg = Colors.white;
    return Material(
      color: career.color,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(career.icon, color: fg, size: 22),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  career.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: fg, fontWeight: FontWeight.w700, fontSize: 13, height: 1.2),
                ),
              ),
            ]),
            const Spacer(),
            Text('${store.careerDone(career)}/${career.totalCourses} courses',
                style: const TextStyle(color: fg, fontSize: 11)),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: store.careerProgress(career),
                minHeight: 5,
                color: fg,
                backgroundColor: Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TreeNode extends StatelessWidget {
  const _TreeNode({
    required this.career,
    required this.node,
    required this.store,
    required this.selected,
    required this.onTap,
  });

  final Career career;
  final SkillNode node;
  final ProgressStore store;
  final bool selected;
  final void Function(SkillNode node, Color color) onTap;

  @override
  Widget build(BuildContext context) {
    final color = career.stageColor(node);
    final unlocked = store.isUnlocked(career, node);
    final complete = store.isComplete(node);
    final cs = Theme.of(context).colorScheme;

    return Opacity(
      opacity: unlocked ? 1 : 0.6,
      child: Material(
        color: complete
            ? Color.alphaBlend(color.withOpacity(0.2), cs.surface)
            : cs.surfaceContainerHighest,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: (complete || selected) ? color : color.withOpacity(0.45),
            width: selected ? 3 : 1.5,
          ),
        ),
        child: InkWell(
          onTap: () => onTap(node, color),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      complete ? Icons.check_circle : (unlocked ? node.icon : Icons.lock_outline),
                      size: 18,
                      color: color,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        node.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, height: 1.2),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text('${store.doneIn(node)}/${node.courses.length} courses',
                    style: const TextStyle(fontSize: 11)),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: store.progressOf(node),
                    minHeight: 5,
                    color: color,
                    backgroundColor: color.withOpacity(0.15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
