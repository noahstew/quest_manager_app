import 'package:flutter/material.dart';
import 'package:todo/data/user_data.dart';
import 'package:todo/models/task.dart';

import 'package:todo/utils.dart';

class AddTaskScreen extends StatefulWidget {
  final Function writeData;
  const AddTaskScreen({required this.writeData, super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  addTask() {
    if (_controller.text.isNotEmpty && _selectedCategory != null) {
      for (int i = 0; i < userCategories.length; i++) {
        if (userCategories[i].name == _selectedCategory) {
          final newTask = Task(
            category: userCategories[i],
            name: _controller.text,
          );
          Navigator.pop(context, [newTask, i]);
          break;
        }
      }
      widget.writeData();
    }
  }

  Map<String, dynamic> categories = {
    for (var i = 0; i < userCategories.length; i++)
      userCategories[i].name: userCategories[i].icon,
  };

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeContext.background,
        title: Text(
          'Add Quest',
          style: textStyle(30, themeContext.primary, FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: themeContext.background,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _controller,
                style: textStyle(24, themeContext.primary, FontWeight.w500),
                maxLength: 21,
                autocorrect: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: themeContext.primaryContainer,
                  hintText: 'Quest Name',
                  hintStyle:
                      textStyle(24, themeContext.primary, FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: themeContext.primaryContainer,
                      ),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCategory,
                            hint: Text(
                              'Select Category',
                              style: textStyle(
                                  18, themeContext.primary, FontWeight.w500),
                            ),
                            underline: Container(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: themeContext.primaryContainer,
                            items: categories.keys.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = value;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      categories[value],
                                      color: themeContext.primary,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      value,
                                      style: textStyle(18, themeContext.primary,
                                          FontWeight.w500),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: 46,
                    decoration: BoxDecoration(
                      color: themeContext.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: addTask,
                      child: Center(
                        child: Text(
                          'Add',
                          style: textStyle(
                            18,
                            themeContext.primary,
                            FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
