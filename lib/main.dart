import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'careers.dart';
import 'models.dart';
import 'progress_store.dart';
import 'tree_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await ProgressStore.load();
  runApp(SkillTreeApp(store: store));
}

class SkillTreeApp extends StatelessWidget {
  const SkillTreeApp({super.key, required this.store});
  final ProgressStore store;

  @override
  Widget build(BuildContext context) {
    ThemeData theme(Brightness b) => ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0175C2), brightness: b),
        );
    return MaterialApp(
      title: 'Career Skill Trees',
      debugShowCheckedModeBanner: false,
      theme: theme(Brightness.light),
      darkTheme: theme(Brightness.dark),
      home: HomeScreen(store: store),
    );
  }
}

// ======================================================================
// Home: pick a career
// ======================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.store});
  final ProgressStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final q = _query.trim().toLowerCase();
    final list = careers
        .where((c) => c.title.toLowerCase().contains(q) || c.tagline.toLowerCase().contains(q))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Career Skill Trees')),
      body: ListenableBuilder(
        listenable: widget.store,
        builder: (context, _) => Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                Text('What do you want to become?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('Pick a job to see its skill tree and the courses to learn.',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search careers',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    isDense: true,
                  ),
                  onChanged: (v) => setState(() => _query = v),
                ),
                const SizedBox(height: 16),
                if (list.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: Text('No careers match your search.')),
                  )
                else
                  LayoutBuilder(builder: (context, c) {
                    const gap = 12.0;
                    final cols = c.maxWidth >= 640 ? 2 : 1;
                    final w = (c.maxWidth - gap * (cols - 1)) / cols;
                    return Wrap(
                      spacing: gap,
                      runSpacing: gap,
                      children: [
                        for (final career in list)
                          SizedBox(
                            width: w,
                            child: _CareerCard(
                              career: career,
                              store: widget.store,
                              onOpen: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CareerScreen(career: career, store: widget.store),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CareerCard extends StatelessWidget {
  const _CareerCard({required this.career, required this.store, required this.onOpen});
  final Career career;
  final ProgressStore store;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final p = store.careerProgress(career);
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: cs.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: career.color.withOpacity(0.18),
                    child: Icon(career.icon, color: career.color, size: 26),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(career.title,
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                        Text('${career.nodes.length} skills  •  ${career.totalCourses} courses',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(career.tagline, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: p,
                  minHeight: 6,
                  color: career.color,
                  backgroundColor: career.color.withOpacity(0.15),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('${(p * 100).round()}% done', style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  FilledButton.tonalIcon(
                    onPressed: onOpen,
                    icon: const Icon(Icons.account_tree, size: 18),
                    label: const Text('View skill tree'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================================
// Career screen: skill tree view + stages list view
// ======================================================================

class CareerScreen extends StatefulWidget {
  const CareerScreen({super.key, required this.career, required this.store});
  final Career career;
  final ProgressStore store;

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  bool _tree = true;
  SkillNode? _selected;

  Career get career => widget.career;
  ProgressStore get store => widget.store;

  Future<void> _confirmReset() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Reset ${career.title} progress?'),
        content: const Text('Every course in this skill tree will be marked as not started.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Reset')),
        ],
      ),
    );
    if (ok == true) await store.resetCareer(career);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(career.title),
        actions: [
          IconButton(
            tooltip: 'Reset this skill tree',
            icon: const Icon(Icons.restart_alt),
            onPressed: _confirmReset,
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) => LayoutBuilder(builder: (context, c) {
          final wide = c.maxWidth >= 900;

          void openNode(SkillNode n, Color color) {
            if (wide && _tree) {
              setState(() => _selected = n);
            } else {
              showNodeSheet(context, career, n, store);
            }
          }

          final treeView = SkillTreeView(
            career: career,
            store: store,
            selectedId: _selected?.id,
            onTap: openNode,
          );

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: true, icon: Icon(Icons.account_tree), label: Text('Skill tree')),
                    ButtonSegment(value: false, icon: Icon(Icons.view_agenda_outlined), label: Text('Stages')),
                  ],
                  selected: {_tree},
                  onSelectionChanged: (s) => setState(() => _tree = s.first),
                ),
              ),
              Expanded(
                child: _tree
                    ? (wide
                        ? Row(
                            children: [
                              Expanded(child: ClipRect(child: treeView)),
                              const VerticalDivider(width: 1),
                              SizedBox(
                                width: 400,
                                child: _selected == null
                                    ? const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(24),
                                          child: Text(
                                            'Select a skill in the tree to see its courses here.',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : NodeDetail(
                                        key: ValueKey(_selected!.id),
                                        career: career,
                                        node: _selected!,
                                        store: store,
                                      ),
                              ),
                            ],
                          )
                        : ClipRect(child: treeView))
                    : _StagesView(career: career, store: store, onTap: openNode),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ======================================================================
// Stages list view (the original screen)
// ======================================================================

String _levelFor(double p) {
  if (p < 0.10) return 'Just starting';
  if (p < 0.30) return 'Getting the basics';
  if (p < 0.60) return 'Building skills';
  if (p < 0.85) return 'Nearly job-ready';
  return 'Job-ready';
}

class _StagesView extends StatelessWidget {
  const _StagesView({required this.career, required this.store, required this.onTap});
  final Career career;
  final ProgressStore store;
  final void Function(SkillNode node, Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: [
            _Header(career: career, store: store),
            const SizedBox(height: 16),
            for (var i = 0; i < career.stages.length; i++)
              _StageSection(career: career, index: i, store: store, onTap: onTap),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.career, required this.store});
  final Career career;
  final ProgressStore store;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final p = store.careerProgress(career);
    return Card(
      color: cs.primaryContainer,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_levelFor(p),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: cs.onPrimaryContainer, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(
              '${store.careerDone(career)} of ${career.totalCourses} courses done  •  '
              '${store.skillsComplete(career)} of ${career.nodes.length} skills complete',
              style: TextStyle(color: cs.onPrimaryContainer),
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(value: p, minHeight: 10),
            ),
            const SizedBox(height: 10),
            Text(
              'A skill opens when the skill it branches from is at least half done.',
              style: TextStyle(color: cs.onPrimaryContainer, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _StageSection extends StatelessWidget {
  const _StageSection({
    required this.career,
    required this.index,
    required this.store,
    required this.onTap,
  });
  final Career career;
  final int index;
  final ProgressStore store;
  final void Function(SkillNode node, Color color) onTap;

  @override
  Widget build(BuildContext context) {
    final stage = career.stages[index];
    final nodes = career.nodes.where((n) => n.stage == index).toList();
    if (nodes.isEmpty) return const SizedBox.shrink();
    final isLast = index == career.stages.length - 1;

    return Container(
      margin: const EdgeInsets.only(left: 18),
      padding: EdgeInsets.only(left: 22, bottom: isLast ? 0 : 24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 3,
            color: isLast ? Colors.transparent : stage.color.withOpacity(0.45),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(-22 - 19.5, 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: stage.color,
                  child: Text('${index + 1}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 22 + 1.5 + 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stage.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      Text(stage.subtitle, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, c) {
            const gap = 10.0;
            final cols = c.maxWidth >= 640 ? 3 : (c.maxWidth >= 260 ? 2 : 1);
            final w = (c.maxWidth - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final n in nodes)
                  SizedBox(
                    width: w,
                    child: _NodeCard(
                      career: career,
                      node: n,
                      color: stage.color,
                      store: store,
                      onTap: onTap,
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _NodeCard extends StatelessWidget {
  const _NodeCard({
    required this.career,
    required this.node,
    required this.color,
    required this.store,
    required this.onTap,
  });
  final Career career;
  final SkillNode node;
  final Color color;
  final ProgressStore store;
  final void Function(SkillNode node, Color color) onTap;

  @override
  Widget build(BuildContext context) {
    final unlocked = store.isUnlocked(career, node);
    final complete = store.isComplete(node);
    final cs = Theme.of(context).colorScheme;

    return Opacity(
      opacity: unlocked ? 1 : 0.55,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: complete ? color.withOpacity(0.18) : cs.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: complete ? color : Colors.transparent, width: 1.5),
        ),
        child: InkWell(
          onTap: () => onTap(node, color),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: color.withOpacity(0.2),
                      child: Icon(node.icon, color: color, size: 20),
                    ),
                    const Spacer(),
                    Icon(
                      complete
                          ? Icons.check_circle
                          : unlocked
                              ? Icons.radio_button_unchecked
                              : Icons.lock_outline,
                      size: 20,
                      color: complete ? color : cs.outline,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(node.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 4),
                Text('${store.doneIn(node)}/${node.courses.length} courses',
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
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

// ======================================================================
// Skill details: shown in a bottom sheet (phones) or a side panel (wide)
// ======================================================================

void showNodeSheet(BuildContext context, Career career, SkillNode node, ProgressStore store) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, controller) =>
          NodeDetail(career: career, node: node, store: store, controller: controller),
    ),
  );
}

class NodeDetail extends StatelessWidget {
  const NodeDetail({
    super.key,
    required this.career,
    required this.node,
    required this.store,
    this.controller,
  });

  final Career career;
  final SkillNode node;
  final ProgressStore store;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final color = career.stageColor(node);
    final stage = career.stages[node.stage];
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final unlocked = store.isUnlocked(career, node);
        return ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.2),
                  child: Icon(node.icon, color: color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(node.title,
                      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text('${stage.title}  •  ${career.title}', style: theme.textTheme.bodySmall),
            const SizedBox(height: 12),
            Text(node.description, style: theme.textTheme.bodyLarge),
            if (node.parent != null) ...[
              const SizedBox(height: 16),
              Text('Learn this first', style: theme.textTheme.titleSmall),
              const SizedBox(height: 6),
              Chip(
                avatar: Icon(
                  store.progressOf(career.byId[node.parent!]!) >= 0.5
                      ? Icons.check_circle
                      : Icons.lock_outline,
                  size: 16,
                ),
                label: Text(career.byId[node.parent!]!.title),
                visualDensity: VisualDensity.compact,
              ),
            ],
            if (!unlocked) ...[
              const SizedBox(height: 12),
              Text(
                'This skill is still locked. You can read the courses now, '
                'but finish half of the skill above it to open it.',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
              ),
            ],
            const SizedBox(height: 20),
            Text('Courses (${store.doneIn(node)}/${node.courses.length} done)',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            for (var i = 0; i < node.courses.length; i++)
              _CourseTile(
                course: node.courses[i],
                done: store.isDone(node.courseId(i)),
                color: color,
                onToggle: () => store.toggle(node.courseId(i)),
              ),
          ],
        );
      },
    );
  }
}

class _CourseTile extends StatelessWidget {
  const _CourseTile({
    required this.course,
    required this.done,
    required this.color,
    required this.onToggle,
  });

  final Course course;
  final bool done;
  final Color color;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onToggle,
      leading: Checkbox(
        value: done,
        activeColor: color,
        onChanged: (_) => onToggle(),
      ),
      title: Text(
        course.title,
        style: TextStyle(decoration: done ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(
        '${course.provider}  •  ${course.duration}  •  ${course.free ? 'Free' : 'Paid'}',
      ),
      trailing: IconButton(
        tooltip: 'Open course',
        icon: const Icon(Icons.open_in_new),
        onPressed: () => launchUrl(course.link, mode: LaunchMode.externalApplication),
      ),
    );
  }
}
