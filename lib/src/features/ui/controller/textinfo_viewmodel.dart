import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/controller/textinfo_model.dart';

class TextinfoViewModel extends StateNotifier<TextinfoModel> {
  TextinfoViewModel(TextinfoModel base) : super(base);

  void changeTitle(String value) {
    state = state.copyWith(title: value);
  }

  void changeSubtitle(String value) {
    state = state.copyWith(subtitle: value);
  }

  void loadDataFromMap(Map<String, dynamic> map) {
    state = TextinfoModel.fromMap(map);
  }
}
