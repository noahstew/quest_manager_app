import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo/adapters/color_adapter.dart';
import 'package:todo/adapters/icondata_adapter.dart';
import 'package:todo/models/category.dart';
import 'package:todo/models/task.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/utils.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(IconDataAdapter());
  Hive.registerAdapter(ColorAdapter());
  var myBox = await Hive.openBox('myBox');
  runApp(MyApp(myBox: myBox));
}

class MyApp extends StatefulWidget {
  final Box myBox;
  const MyApp({super.key, required this.myBox});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Box _isDarkModeBox;
  bool isDarkMode = false;

  @override
  void initState() {
    _isDarkModeBox = widget.myBox;
    if (_isDarkModeBox.get('isDarkMode') != null) {
      isDarkMode = _isDarkModeBox.get('isDarkMode');
    }
    super.initState();
  }

  void toggleDarkMode() {
    _isDarkModeBox.put('isDarkMode', !isDarkMode);
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SideQuestor',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(toggleDarkMode: toggleDarkMode),
    );
  }
}
