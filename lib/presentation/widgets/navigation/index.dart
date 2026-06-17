import 'package:coursework/presentation/widgets/shared/language_switch.dart';
import 'package:flutter/material.dart';

import 'drawer_menu_item.dart';

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ГЛАВНАЯ'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              const LanguageSwitch(),
              TextButton(
                onPressed: () {},
                child: const Text('ADMIN', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: const Color(0xFFF0F2F5),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 50),
              
              DrawerMenuItem(icon: Icons.search, title: 'Поиск', onTap: () {}),
              DrawerMenuItem(icon: Icons.directions_run, title: 'Тренинг', onTap: () {}),
              DrawerMenuItem(icon: Icons.star_border, title: 'Общие', onTap: () {}),
              DrawerMenuItem(icon: Icons.g_translate, title: 'Герундий', onTap: () {}),
              DrawerMenuItem(icon: Icons.style, title: 'Фразы', onTap: () {}),
              DrawerMenuItem(icon: Icons.waves, title: 'Идиомы', onTap: () {}),
              DrawerMenuItem(icon: Icons.chat_bubble_outline, title: 'Глаголы', onTap: () {}),
              
              const Divider(),
              
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'СОСТАВ БД:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Words 3625'),
                    Text('Phrases 462'),
                    Text('Gerunds 299'),
                    Text('Phrasals 876'),
                    Text('Idioms 83'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: const Center(child: Text('Main Screen Content')),
    );
  }
}
