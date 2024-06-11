import 'package:flutter/material.dart';
import 'package:todo/utils.dart';
import 'package:todo/widgets/add_category.dart';
import 'package:todo/widgets/delete_category.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  bool isAdding = true;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeContext.background,
        title: Text(
          'Manage Categories',
          style: textStyle(
            30,
            themeContext.primary,
            FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: isAdding
                          ? themeContext.primaryContainer
                          : themeContext.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isAdding = true;
                        });
                      },
                      child: Text(
                        'Add',
                        style: textStyle(
                          24,
                          themeContext.primary,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: !isAdding
                          ? themeContext.primaryContainer
                          : themeContext.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isAdding = false;
                        });
                      },
                      child: Text(
                        'Delete',
                        style: textStyle(
                          24,
                          themeContext.primary,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isAdding ? const AddCategory() : const DeleteCategory(),
            ),
          ],
        ),
      ),
    );
  }
}
