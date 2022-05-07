import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/textinfo_model.dart';
import 'package:obs_animated_banners/src/features/ui/messages/custom_snackbar.dart';
import 'package:obs_animated_banners/src/features/ui/storage/crud.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/minimal_buttons.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/primary_button.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/text_container.dart';

class GroupList extends ConsumerWidget {
  GroupList({Key? key}) : super(key: key);

  late Crud crud;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final groupModel = ref.watch(listGroupPod);
    final futureCrud = ref.watch(crudPod);
    final textInfo = ref.watch(textinfoPod);

    futureCrud.whenData((value) => crud = value);
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
                                group.texts.length + 1);
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
                    Wrap(
                      children: List.generate(group.texts.length, (index2) {
                        final isSelected = (indexGroup == index &&
                            indexText == group.texts[index2]["index"]);
                        return GestureDetector(
                          onTap: () => ref
                              .read(listGroupPod.notifier)
                              .changeSelection(
                                  index, group.texts[index2]["index"]),
                          child: TextContainer(
                            isSelected: isSelected,
                            child: Text(
                              (group.texts[index2]["index"]).toString(),
                            ),
                          ),
                        );
                      }),
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
