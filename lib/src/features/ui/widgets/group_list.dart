import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/messages/custom_snackbar.dart';
import 'package:obs_animated_banners/src/features/ui/storage/crud.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/minimal_buttons.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/text_container.dart';

class GroupList extends ConsumerStatefulWidget {
  const GroupList({
    Key? key,
    required this.titleController,
    required this.subtitleController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController subtitleController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupListState();
}

class _GroupListState extends ConsumerState<GroupList> {
  late Crud crud;

  @override
  void initState() {
    _loadInitData();
    super.initState();
  }

  void _loadInitData() async {
    crud = ref.read(crudProvider);
    await crud.init();
    final initGroups = crud.getGroups();
    ref.read(listGroupPod.notifier).updateGroups(initGroups);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final groupModel = ref.watch(listGroupPod);
    final textInfo = ref.watch(textinfoPod);

    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: List.generate(groupModel.groups.length, (index) {
              final group = groupModel.groups[index];
              final indexGroup = groupModel.indexGroup;
              final indexText = groupModel.indexText;

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(group.name)),
                        MinimalButtons(
                          onTap: () {
                            if (textInfo.title == null ||
                                textInfo.title!.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(noTitleSnackbar(context));
                              return;
                            }

                            crud.addText(group.name, textInfo.toMap(),
                                group.texts.length + 1, true);
                          },
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MinimalButtons(
                          onTap: () {
                            crud.deleteGroup(group.name);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        children: List.generate(group.texts.length, (index2) {
                          final isSelected = (indexGroup == index &&
                              indexText == group.texts[index2]["index"]);
                          return GestureDetector(
                            onTap: () {
                              ref.read(listGroupPod.notifier).changeSelection(
                                  index, group.texts[index2]["index"]);

                              ref
                                  .read(configBannerPod.notifier)
                                  .loadConfigFromMap(group.group);

                              ref
                                  .read(textinfoPod.notifier)
                                  .loadDataFromMap(group.texts[index2]);

                              widget.titleController.text =
                                  group.texts[index2]["title"];
                              widget.subtitleController.text =
                                  group.texts[index2]["subtitle"];
                            },
                            child: TextContainer(
                              isSelected: isSelected,
                              child: Text(
                                (group.texts[index2]["index"]).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
