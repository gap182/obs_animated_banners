import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:obs_animated_banners/src/features/ui/messages/custom_snackbar.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';
import 'package:obs_animated_banners/src/features/ui/storage/crud.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/animation_button.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/group_list.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/primary_button.dart';

class SavedBanner extends ConsumerStatefulWidget {
  const SavedBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedBannerState();
}

class _SavedBannerState extends ConsumerState<SavedBanner> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final groupController = TextEditingController();

  late Crud crud;

  @override
  void initState() {
    _loadInitData();
    titleController.text = ref.read(textinfoPod).title ?? '';
    subtitleController.text = ref.read(textinfoPod).subtitle ?? '';
    super.initState();
  }

  void _loadInitData() async {
    crud = ref.read(crudProvider);
    await crud.init();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final configPod = ref.watch(configBannerPod);
    final bannerStorageModel = ref.watch(bannerStoragePod);

    final controller = ref.read(animationControllerPod.notifier);
    final configViewmodel = ref.read(configBannerPod.notifier);
    final textinfoViewmodel = ref.read(textinfoPod.notifier);
    final bannerStorageViewmodel = ref.read(bannerStoragePod.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.title),
              ),
              controller: titleController,
              onChanged: textinfoViewmodel.changeTitle,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.subtitle),
              ),
              onChanged: textinfoViewmodel.changeSubtitle,
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
                    final locked = ref
                        .watch(configBannerPod.select((value) => value.locked));
                    return Expanded(
                      child: AnimationButton(
                        child: locked
                            ? const Icon(Icons.lock_open)
                            : const Icon(Icons.lock),
                        onTap: configViewmodel.changeLock,
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
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: groupController,
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.nameGroup),
                    ),
                    onChanged: bannerStorageViewmodel.changeName,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: PrimaryButton(
                    onPressed: bannerStorageModel.name.isNotEmpty
                        ? () {
                            final bannerStorage = BannerStorage(
                                group: configPod.toMap(),
                                // ignore: prefer_const_literals_to_create_immutables
                                texts: [],
                                name: bannerStorageModel.name);

                            if (crud.existGroup(bannerStorage.name)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(groupExistSnackbar(context));
                              return;
                            }

                            crud.addGroup(bannerStorage.name, bannerStorage);
                          }
                        : null,
                    text: AppLocalizations.of(context)!.saveGroup,
                    height: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: () {
                crud.deleteAllGroups();
              },
              text: AppLocalizations.of(context)!.deleteGroups,
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const GroupList()
          ],
        ),
      ),
    );
  }
}
