import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect, {super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            'Stay in the Know with news you care about',
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
