import 'package:flutter/material.dart';
import 'package:todo/screens/manage_categories.dart';
import 'package:todo/utils.dart';

class ManageCategoriesButton extends StatelessWidget {
  const ManageCategoriesButton({super.key});

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const ManageCategoriesScreen();
              }),
            );
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
