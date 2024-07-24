import 'package:fdls/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hyprland_ipc/hyprland_ipc.dart';
import 'package:hyprland_ipc/hyprland_ipc.dart' as hypr;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspaces.g.dart';

@Riverpod(keepAlive: true)
Future<HyprlandIPC> hyprland(HyprlandRef ref) async {
  return await HyprlandIPC.fromInstance();
}

@riverpod
Stream<List<Workspace>> workspaces(WorkspacesRef ref) async* {
  final hypr = await ref.watch(hyprlandProvider.future);

  yield await getWorkspaces(hypr);

  await for (final event in hypr.eventsStream) {
    print(event);
    yield await getWorkspaces(hypr);
  }
}

Future<List<Workspace>> getWorkspaces(hypr.HyprlandIPC hypr) async {
  final workspaces = await hypr.getWorkspaces();
  final monitors = await hypr.getMonitors();

  workspaces.sort((a, b) => a.id.compareTo(b.id));
  return workspaces
      .map((e) => Workspace(workspace: e, monitors: monitors))
      .toList();
}

class Workspace {
  final hypr.Workspace workspace;
  final bool visible;

  Workspace({
    required this.workspace,
    required List<Monitor> monitors,
  }) : visible = monitors.any((e) => e.activeWorkspaceId == workspace.id);
}

class WorkspacesComponent extends ConsumerWidget {
  const WorkspacesComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(workspacesProvider).when(
          data: (workspaces) {
            final widgets = <Widget>[];

            for (var id = 1; id <= workspaces.last.workspace.id; id++) {
              final workspace =
                  workspaces.where((e) => e.workspace.id == id).firstOrNull;

              widgets.add(
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Opacity(
                    opacity: workspace == null ? 0.1 : 1,
                    child: Component(
                      primaryColor: Colors.blue,
                      border: workspace != null && workspace.visible
                          ? const BorderSide(width: 1.2, color: Colors.blue)
                          : BorderSide.none,
                      onTap: () async {
                        final hypr = await ref.read(hyprlandProvider.future);
                        hypr.changeToWorkspace(WorkspaceRefID(id.toString()));
                      },
                      child: const SizedBox(),
                    ),
                  ),
                ),
              );
            }

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            );
          },
          error: (e, st) => Component(
            primaryColor: Colors.red,
            child: ComponentErrorContents(e, st),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );

    // builder: (workspaces) => Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     for (var i = 1; i <= workspaces.last.id; i++)
    //       Padding(
    //         padding: const EdgeInsets.all(8),
    //         child: SizedBox(
    //           width: 8,
    //           height: 8,
    //           child: Material(
    //             color: Colors.blue,
    //             borderRadius: BorderRadius.circular(4),
    //           ),
    //         ),
    //       ),
    //   ],
    // ),
  }
}
