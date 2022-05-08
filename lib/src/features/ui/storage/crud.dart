import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';

class Crud {
  Crud(this.ref);

  late Box<BannerStorage>? box;
  final Ref ref;

  Future<void> init() async {
    box = await Hive.openBox('banner');
  }

  void addGroup(String name, BannerStorage bannerStorage) {
    if (box != null) {
      box!.put(name, bannerStorage);
    }

    ref.read(listGroupPod.notifier).updateGroups(getGroups());
  }

  BannerStorage? readGroup(String name) {
    if (box == null) return null;
    final result = box!.get(name);
    return result;
  }

  void updateGroup(String name, BannerStorage currentBanner,
      BannerStorage oldBannerStorage) {
    if (box == null) return;
    final result = box!.get(name);
    final oldTexts = <Map<String, dynamic>>[];

    if (result != null) {
      oldTexts.addAll(result.texts);
    }

    final newBannerStorage =
        BannerStorage(group: currentBanner.group, texts: oldTexts, name: name);

    deleteGroup(name);
    addGroup(name, newBannerStorage);

    ref.read(listGroupPod.notifier).updateGroups(getGroups());
  }

  void deleteGroup(String name) {
    if (box == null) return;
    box!.delete(name);
    ref.read(listGroupPod.notifier).updateGroups(getGroups());
  }

  void deleteAllGroups() {
    if (box == null) return;
    final storages = box!.values.toList();
    List<String> keys = [];

    for (BannerStorage item in storages) {
      keys.add(item.name);
    }

    box!.deleteAll(keys);
    ref.read(listGroupPod.notifier).updateGroups(getGroups());
  }

  void addText(String name, Map<String, dynamic> text, int index, bool update) {
    if (box == null) return;
    final storage = box!.get(name);
    if (storage == null) return;
    text["index"] = index;

    final texts = storage.texts;
    texts.add(text);
    final newStorage = storage.copyWith(texts: texts);
    box!.delete(name);
    box!.put(name, newStorage);
    if (update) {
      ref.read(listGroupPod.notifier).updateGroups(getGroups());
    }
  }

  void deleteText(String name, int index) {
    if (box == null) return;
    final storage = box!.get(name);
    if (storage == null) return;
    final texts = storage.texts;
    texts.removeWhere((element) => element["index"] == index);
    final newStorage = storage.copyWith(texts: texts);
    box!.delete(name);
    box!.put(name, newStorage);

    ref.read(listGroupPod.notifier).updateGroups(getGroups());
  }

  List<BannerStorage> getGroups() {
    if (box == null) return [];
    final list = box!.values.toList();
    return list;
  }

  bool existGroup(String name) {
    if (box == null) return true;
    return box!.containsKey(name);
  }
}
