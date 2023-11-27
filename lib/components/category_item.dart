import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category, {super.key});

  void _selectCategory(BuildContext context) {
/*     Platform.isIOS
        ? Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
            return CategoriesMealsScreen();
          }))
        : Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return CategoriesMealsScreen();
          })); */
    Navigator.of(context).pushNamed(
      AppRoutes.categoriesMeal,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
