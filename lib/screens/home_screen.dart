import 'package:flutter/material.dart';
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
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
              // TODO: Make summary widget
              ListView.builder(
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
                            userCategories[index].isExpanded = !isExpanded;
                          });
                          print(userCategories[index].userTasks.length);
                        },
                        child: !isExpanded
                            ? CategoryOverview(
                                category: userCategories[index],
                                idx: index,
                              )
                            : CategoryDetails(
                                category: userCategories[index],
                                idx: index,
                              ),
                      ),
                      if (index != userCategories.length - 1)
                        const SizedBox(height: 16)
                    ],
                  );
                },
              ),
              const ManageCategoriesButton(),
            ],
          ),
        ),
      ),
    );
  }
}
