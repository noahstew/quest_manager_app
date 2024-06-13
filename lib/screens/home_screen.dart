import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/category.dart';
import 'package:todo/screens/add_task_screen.dart';
import 'package:todo/utils.dart';
import 'package:todo/widgets/category_details.dart';
import 'package:todo/widgets/category_overview.dart';
import 'package:todo/widgets/manage_categories_button.dart';
import 'package:todo/data/user_data.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleDarkMode;

  const HomeScreen({super.key, required this.toggleDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userCategoriesBox = Hive.box('userCategories');

  void writeData() {
    _userCategoriesBox.put('userCategories', userCategories);
  }

  void readData() {
    if (_userCategoriesBox.get('userCategories') != null) {
      userCategories = _userCategoriesBox.get('userCategories');
    }
  }

  void deleteData() {
    _userCategoriesBox.delete('userCategories');
  }

  removeCategory(String id) {
    setState(() {
      userCategories.removeWhere((element) => element.id == id);
    });
  }

  addCategory(Category newCategory) {
    setState(() {
      userCategories.add(newCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeContext.primaryContainer,
        elevation: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: widget.toggleDarkMode,
              icon: Icon(
                isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: themeContext.primary,
                size: 30,
              ),
            ),
          ),
        ],
        title: Text(
          'Side Questor',
          style: textStyle(30, themeContext.primary, FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            setState(() {
              userCategories[newTask[1]].addTask(newTask[0]);
            });
          }
        },
        backgroundColor: themeContext.surface,
        child: Icon(Icons.add_rounded, color: themeContext.primary, size: 30),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userCategories.isEmpty
                  ? Center(
                      child: Card(
                        elevation: 2,
                        color: themeContext.primaryContainer,
                        shadowColor: themeContext.primary,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              'Welcome to Side Questor!',
                              style: textStyle(
                                  30, themeContext.primary, FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '(Continue reading for how to use)',
                              style: textStyle(
                                  16, themeContext.primary, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: themeContext.primary,
                              thickness: 1.0,
                              indent: 16,
                              endIndent: 16,
                            ),
                            Text(
                              'Add a category with Manage Categories button below',
                              style: textStyle(
                                  20, themeContext.primary, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: themeContext.primary,
                              thickness: 1.0,
                              indent: 96,
                              endIndent: 96,
                            ),
                            Text(
                              'Then add tasks to your categories with the + button below',
                              style: textStyle(
                                  20, themeContext.primary, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: themeContext.primary,
                              thickness: 1.0,
                              indent: 96,
                              endIndent: 96,
                            ),
                            Text(
                              'Delete categories and tasks by swiping them left or right',
                              style: textStyle(
                                  20, themeContext.primary, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: themeContext.primary,
                              thickness: 1.0,
                              indent: 96,
                              endIndent: 96,
                            ),
                            Text(
                              'Expand categories by long pressing them',
                              style: textStyle(
                                  20, themeContext.primary, FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: userCategories.length,
                      itemBuilder: (context, index) {
                        bool isExpanded = userCategories[index].isExpanded;
                        return Column(
                          children: [
                            InkWell(
                              onLongPress: () {
                                setState(() {
                                  userCategories[index].isExpanded =
                                      !isExpanded;
                                });
                              },
                              child: !isExpanded
                                  ? CategoryOverview(
                                      category: userCategories[index],
                                      idx: index,
                                    )
                                  : CategoryDetails(
                                      category: userCategories[index],
                                      idx: index,
                                      numCompletedTasks: userCategories[index]
                                          .userTasks
                                          .where((task) => task.isDone)
                                          .length,
                                    ),
                            ),
                            if (index != userCategories.length - 1)
                              const SizedBox(height: 16)
                          ],
                        );
                      },
                    ),
              ManageCategoriesButton(
                  addCategory: addCategory, removeCategory: removeCategory),
            ],
          ),
        ),
      ),
    );
  }
}
