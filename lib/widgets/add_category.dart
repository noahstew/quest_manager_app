import 'package:flutter/material.dart';
import 'package:todo/data/app_data.dart';
import 'package:todo/models/category.dart';
import 'package:todo/utils.dart';

class AddCategory extends StatefulWidget {
  final dynamic addCategory;
  const AddCategory({required this.addCategory, super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _controller = TextEditingController();
  Color? _selectedColor;
  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: _controller,
            style: textStyle(24, themeContext.primary, FontWeight.w500),
            maxLength: 13,
            autocorrect: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: themeContext.primaryContainer,
              hintText: 'Category Name',
              hintStyle: textStyle(24, themeContext.primary, FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(chooseableIcons.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _selectedIcon == chooseableIcons[index]
                      ? themeContext.surface
                      : themeContext.primaryContainer,
                ),
                child: IconButton(
                  iconSize: 36,
                  icon: Icon(
                    chooseableIcons[index],
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIcon = chooseableIcons[index];
                    });
                  },
                  color: themeContext.primary,
                ),
              ),
            );
          }),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(chooseableColors.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedColor = chooseableColors[index];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _selectedColor == chooseableColors[index]
                          ? themeContext.primary
                          : chooseableColors[index],
                      width: 6,
                    ),
                    color: chooseableColors[index],
                  ),
                ),
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 8,
            right: 8,
            bottom: 8,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: themeContext.surface,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () {
                final newCategory = Category(
                  name: _controller.text,
                  icon: _selectedIcon!,
                  color: _selectedColor!,
                );
                Navigator.pop(context);
                widget.addCategory(newCategory);
              },
              child: Text(
                'Add to Category List',
                style: textStyle(
                  20,
                  themeContext.primary,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
