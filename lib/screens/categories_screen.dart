import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/screens/widgets/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect, {super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.quote,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  /*In need when pressing on a category, make a change on the home screen
                  So I will create a call back function in HomeLayout*/
                    onTap: () {
                      onCategorySelect(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
              },
            ),
          )
        ],
      ),
    );
  }
}
