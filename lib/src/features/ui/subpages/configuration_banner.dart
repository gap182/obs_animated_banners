import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';

import 'package:obs_animated_banners/src/core/theme/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:obs_animated_banners/src/features/ui/widgets/config_options.dart';

class ConfigurationBanner extends ConsumerStatefulWidget {
  const ConfigurationBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfigurationBannerState();
}

class _ConfigurationBannerState extends ConsumerState<ConfigurationBanner> {
  @override
  Widget build(BuildContext context) {
    final isConfig =
        ref.watch(configBannerPod.select((value) => value.isConfig));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.configuration,
                  style: h1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Switch(
                    value: isConfig,
                    onChanged: (v) => ref
                        .read(configBannerPod.notifier)
                        .changeConfigActivation()),
                Text(AppLocalizations.of(context)!.activateConfig),
                isConfig ? const ConfigOptions() : const SizedBox.shrink(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
