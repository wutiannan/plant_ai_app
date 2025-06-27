import 'package:flutter/material.dart';
import 'plant_model.dart'; // 假设植物模型在这个文件中

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部导航栏
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/main_icon_back.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      '培养说明',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/main_icon_menu.png',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 植物名称和英文名称
                Text(
                  plant.name,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                Text(
                  plant.enName,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),

                // 培养说明文字区域
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.6,
                    ),
                    children: [
                      WidgetSpan(
                        child: Container(
                          width: 4,
                          height: 100, // 调整竖线高度以匹配文本
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      TextSpan(text: plant.description),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 植物图片
                Center(
                  child: Image.asset(
                    plant.image,
                    width: 200,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),

                // 底部按钮
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 120,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '开始培养',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
