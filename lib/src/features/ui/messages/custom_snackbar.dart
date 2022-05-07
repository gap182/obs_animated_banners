import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

SnackBar groupExistSnackbar(BuildContext context) {
  return SnackBar(content: Text(AppLocalizations.of(context)!.existGroup));
}
