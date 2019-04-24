
import 'package:dod_camera/src/common/localization_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Localization{

  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context){
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, dynamic>> _localizedValues = {
    'pt' : pt,
    //'en' : en
  };

  getString(String key) => _localizedValues[locale.languageCode][key];

}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {

  @override
  bool isSupported(Locale locale) => ['pt','ja'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => SynchronousFuture<Localization>(Localization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;

}