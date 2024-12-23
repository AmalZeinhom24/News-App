import 'dart:ui';
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

  static List<CategoryData> getCategories(){
    return [
      CategoryData('sports', 'Sports', 'assets/images/sports.png', Color(0xFFC91C22)),
      CategoryData('business', 'Business', 'assets/images/bussines.png', Color(0xFFCF7E48)),
      CategoryData('entertainment', 'Entertainment', 'assets/images/entertainment.png', Color(0xFF003E90)),
      CategoryData('health', 'Health', 'assets/images/health.png', Color(0xFFED1E79)),
      CategoryData('science', 'Science', 'assets/images/science.png', Color(0xFFF2D352)),
      CategoryData('general', 'General', 'assets/images/environment.png', Color(0xFF4882CF)),
      CategoryData('technology', 'Technology', 'assets/images/technologies.png', Color(0xFF39A552)),
    ];
  }
}
