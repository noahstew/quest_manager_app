import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/utils.dart';

class DeleteCategory extends StatefulWidget {
  final dynamic removeCategory;

  const DeleteCategory({required this.removeCategory, super.key});

  @override
  State<DeleteCategory> createState() => _DeleteCategoryState();
}

class _DeleteCategoryState extends State<DeleteCategory> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;

    return ListView.builder(
        itemCount: userCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final category = userCategories[index];
          return Dismissible(
            key: Key(category.id),
            onDismissed: (direction) {
              widget.removeCategory(category.id);
            },
            child: Card(
              color: themeContext.primaryContainer,
              child: ListTile(
                title: Text(
                  userCategories[index].name,
                  style: textStyle(24, themeContext.primary, FontWeight.w500),
                ),
                leading: Icon(
                  userCategories[index].icon,
                  color: userCategories[index].color,
                  size: 36,
                ),
              ),
            ),
          );
        });
  }
}
