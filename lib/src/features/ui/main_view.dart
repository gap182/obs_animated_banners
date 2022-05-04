import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/subpages/configuration_banner.dart';
import 'package:obs_animated_banners/src/features/ui/subpages/saved_banner.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/background_side.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.grey[200],
            child: PageView(
              children: const [
                ConfigurationBanner(),
                SavedBanner(),
              ],
            ),
          ),
          Container(
            width: 5,
            color: Colors.grey,
          ),
          const BackgroundSide(),
        ],
      ),
    );
  }
}
