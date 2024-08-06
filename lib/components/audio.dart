import 'package:fdls/constants.dart';
import 'package:fdls/src/rust/api/pipewire.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/component_hover_popup.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio.g.dart';
// part 'audio.freezed.dart';

@riverpod
Stream<List<void>> audioStream(AudioStreamRef ref) async* {}

class AudioComponent extends ConsumerWidget {
  const AudioComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audios = ref.watch(audioStreamProvider);

    return Component(
      primaryColor: Colors.green,
      width: fdlsSmallComponentWidth,
      popup: const _Popup(),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {},
        child: TwoRow(
          top: const Text("..."),
          icon: const Icon(Icons.volume_up),
          bottom: LinearProgressIndicator(
            value: 0.5,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _Popup extends ConsumerWidget {
  const _Popup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    pipewireSendMsg(msg: PipeWireMsg.print);
    final objects = pipewireGetGlobals();

    const filters = [
      (enum_: ObjectType.client(), label: "Client"),
      (enum_: ObjectType.core(), label: "Core"),
      (enum_: ObjectType.device(), label: "Device"),
      (enum_: ObjectType.endpoint(), label: "Endpoint"),
      (enum_: ObjectType.factory_(), label: "Factory"),
      (enum_: ObjectType.link(), label: "Link"),
      (enum_: ObjectType.node(), label: "Node"),
      (enum_: ObjectType.port(), label: "Port"),
      (enum_: ObjectType.session(), label: "Session"),
    ];

    final selectedFilters = ref.watch(filterProvider);

    final filteredObjects = objects.where((element) {
      if (selectedFilters.isEmpty) {
        return true;
      }

      return selectedFilters.contains(element.kind);
    }).toList();

    return ComponentHoverPopup(
      icon: Icons.volume_up,
      title: "Audio",
      body: Column(
        children: [
          SegmentedButton<ObjectType>(
            segments: filters
                .map((e) => ButtonSegment(
                      value: e.enum_,
                      label: Text(e.label),
                    ))
                .toList(),
            selected: selectedFilters,
            emptySelectionAllowed: true,
            multiSelectionEnabled: true,
            showSelectedIcon: false,
            onSelectionChanged: (selected) {
              ref.read(filterProvider.notifier).state = selected;
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredObjects.length,
              itemBuilder: (context, index) {
                final object = filteredObjects[index];

                return ListTile(
                  title: Text(
                    object.props.entries
                            .where((e) => e.key.endsWith("name"))
                            .firstOrNull
                            ?.value ??
                        "???",
                  ),
                  subtitle: Text(object.kind.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final filterProvider = StateProvider<Set<ObjectType>>((ref) => {});
