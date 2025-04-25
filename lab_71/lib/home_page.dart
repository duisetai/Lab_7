import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final locale = context.locale.languageCode == 'en'
                  ? Locale('ru')
                  : Locale('en');
              context.setLocale(locale);
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: "title".tr()),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User Info"),
        ],
      ),
    );
  }
}

class RegistrationPage {}
