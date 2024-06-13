import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/screens/manage_categories_screen.dart';
import 'package:todo/utils.dart';

class ManageCategoriesButton extends StatefulWidget {
  final dynamic addCategory;
  final dynamic removeCategory;
  const ManageCategoriesButton(
      {required this.addCategory, required this.removeCategory, super.key});

  @override
  State<ManageCategoriesButton> createState() => _ManageCategoriesButtonState();
}

class _ManageCategoriesButtonState extends State<ManageCategoriesButton> {
  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 8,
        right: 8,
        bottom: 8,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeContext.primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: () async {
            final newCategory = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ManageCategoriesScreen(
                    addCategory: widget.addCategory,
                    removeCategory: widget.removeCategory);
              }),
            );

            if (newCategory != null) {
              setState(() {
                userCategories.add(newCategory);
              });
            }
          },
          child: Text(
            'Manage Categories',
            style: textStyle(
              20,
              themeContext.primary,
              FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
