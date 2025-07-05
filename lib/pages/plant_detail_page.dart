import 'package:flutter/material.dart';
import '../models/plant_model.dart';
import 'cultivation_interaction_page.dart'; // 引入培养互动页

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/main_icon_back.png',
            width: 22,
            height: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '培养说明',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/main_icon_menu.png',
              width: 22,
              height: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/base_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 30),
                // 绿色竖条和文字左右结构
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 120,
                      margin: const EdgeInsets.only(right: 12, top: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 植物名称和英文名称
                          Text(
                            plant.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            plant.enName,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            plant.description,
                            style: TextStyle(fontSize: 14, height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
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

                // 圆形按钮（白色边框+绿色阴影）
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 150),
                    width: 60,
                    height: 60, // 增大高度使按钮成为圆形
                    child: ElevatedButton(
                      onPressed: () {
                        // 按钮点击事件
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CultivationInteractionPage(plant: plant),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), // 圆形按钮
                        backgroundColor: Colors.white.withOpacity(0.8), // 按钮背景色
                        padding: EdgeInsets.zero, // 去除内边距
                        elevation: 6, // 按钮阴影深度
                        shadowColor: Colors.green.withOpacity(0.5), // 绿色阴影
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // 白色边框
                            width: 2, // 边框宽度
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '开始培养',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                            ),
                          ),
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
