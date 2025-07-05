// main.dart
import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/home_page.dart'; // 导入首页
import 'package:plant_ai_app/pages/ar_explore_page.dart'; // 导入探索页
import 'package:plant_ai_app/pages/virtual_garden_page.dart'; // 导入种植页

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '植域',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TabNavigator(),
    );
  }
}

// 自定义底部导航栏
class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ARExplorePage(),
    VirtualPlantIllustrationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: true, // 让内容延伸到底部导航栏下方
      bottomNavigationBar: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.transparent, // 透明背景
        ),
        child: Stack(
          alignment: Alignment.bottomCenter, // 底部居中对齐
          children: [
            // 白色半透明横条（宽度319，高度64，底部间距30，完全居中）
            Positioned(
              bottom: 10, // 距离屏幕底部30px
              child: Container(
                width: 319,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7), // 白色半透明
                  borderRadius: BorderRadius.circular(32), // 圆角32
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
              ),
            ),
            // 导航图标（调整间距并确保底部对齐）
            Positioned(
              bottom: 10,
              width: 396,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // 使用spaceEvenly更均匀分布
                children: [
                  _buildNavItem(
                    0,
                    '首页',
                    'assets/images/main_icon_home.png',
                    'assets/images/main_icon_home_active.png',
                  ),
                  _buildNavItem(
                    1,
                    '探索',
                    'assets/images/main_icon_camera.png',
                    'assets/images/main_icon_camera_active.png',
                  ),
                  _buildNavItem(
                    2,
                    '种植',
                    'assets/images/main_icon_plant.png',
                    'assets/images/main_icon_plant_active.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建单个导航项（优化底部对齐）
  Widget _buildNavItem(
    int index,
    String label,
    String iconPath,
    String activeIconPath, {
    bool isSpecial = false,
  }) {
    final isSelected = _selectedIndex == index;
    final double iconSize = isSelected ? 74 : 48;
    // final double verticalOffset = isSelected ? 0 : 4;

    return GestureDetector(
      onTap: () {
        if (isSpecial) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('点击了中间按钮')));
        } else {
          setState(() => _selectedIndex = index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 移除Padding并直接使用Container
          Container(
            width: isSpecial ? 60 : iconSize,
            height: isSpecial ? 60 : iconSize,
            decoration: isSpecial
                ? BoxDecoration(color: Colors.green, shape: BoxShape.circle)
                : null,
            child: Center(
              child: Image.asset(
                isSelected ? activeIconPath : iconPath,
                width: isSpecial ? 32 : iconSize,
                height: isSpecial ? 32 : iconSize,
                color: isSpecial ? Colors.white : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
