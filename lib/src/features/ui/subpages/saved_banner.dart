import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/animation_button.dart';

class SavedBanner extends ConsumerStatefulWidget {
  const SavedBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedBannerState();
}

class _SavedBannerState extends ConsumerState<SavedBanner> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  void initState() {
    titleController.text = ref.read(configBannerPod).title;
    subtitleController.text = ref.read(configBannerPod).subtitle;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(animationControllerPod.notifier);
    final configViewmodel = ref.read(configBannerPod.notifier);
    // final values = ref.watch(animationControllerPod);
    // final isLocked =
    //     ref.watch(animationControllerPod.select((value) => value.locked));

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.title),
                ),
                controller: titleController,
                onChanged: (v) =>
                    ref.read(configBannerPod.notifier).changeTitle(v),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.subtitle),
                ),
                onChanged: configViewmodel.changeSubtitle,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AnimationButton(
                      child: const Icon(Icons.play_arrow),
                      onTap: controller.start,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AnimationButton(
                      child: const Icon(Icons.arrow_back),
                      onTap: controller.back,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AnimationButton(
                      child: const Icon(Icons.stop),
                      onTap: controller.stop,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return Expanded(
                        child: AnimationButton(
                          child: Icon(Icons.lock),
                          onTap: controller.changeLock,
                          color: null,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AnimationButton(
                      child: const Icon(Icons.repeat),
                      onTap: controller.reset,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
