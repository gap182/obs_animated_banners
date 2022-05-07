import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';

class GroupList extends ConsumerWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final groups = ref.watch(listGroupPod);
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: List.generate(groups.groups.length, (index) {
              final group = groups.groups[index];

              return Column(
                children: [
                  Container(
                    width: size.width,
                    height: 30,
                    child: Text(group.name),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: List.generate(group.texts.length, (index2) {
                      return Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          index2.toString(),
                        ),
                      );
                    }),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
