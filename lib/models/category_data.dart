import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/*
 the main purpose of this model to change the layout only,
 when press on a photo from categories without create a screen for each category
*/
class CategoryData{
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);

  static List<CategoryData> getCategories(BuildContext context){
    return [
      CategoryData('sports', AppLocalizations.of(context)!.sports, 'assets/images/sports.png', Color(0xFFC91C22)),
      CategoryData('business', AppLocalizations.of(context)!.business, 'assets/images/bussines.png', Color(0xFFCF7E48)),
      CategoryData('entertainment', AppLocalizations.of(context)!.entertainment, 'assets/images/entertainment.png', Color(0xFF003E90)),
      CategoryData('health', AppLocalizations.of(context)!.health, 'assets/images/health.png', Color(0xFFED1E79)),
      CategoryData('science', AppLocalizations.of(context)!.science, 'assets/images/science.png', Color(0xFFF2D352)),
      CategoryData('general', AppLocalizations.of(context)!.general, 'assets/images/environment.png', Color(0xFF4882CF)),
      CategoryData('technology', AppLocalizations.of(context)!.technology, 'assets/images/technologies.png', Color(0xFF39A552)),
    ];
  }
}
