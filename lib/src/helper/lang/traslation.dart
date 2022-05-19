import 'package:boutiqnet/src/helper/lang/ar.dart';
import 'package:boutiqnet/src/helper/lang/en.dart';
import 'package:boutiqnet/src/helper/lang/fr.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'fr': fr,
        'en': en,
      };
}
