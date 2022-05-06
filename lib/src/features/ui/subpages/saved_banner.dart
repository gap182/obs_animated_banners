import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';

class SavedBanner extends ConsumerStatefulWidget {
  const SavedBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedBannerState();
}

class _SavedBannerState extends ConsumerState<SavedBanner> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(animationControllerPod.notifier);
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          child: Text("press")),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () => controller.reset(),
              child: Text("reset"),
            ),
            ElevatedButton(
              onPressed: () => controller.back(),
              child: Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}
