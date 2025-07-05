import 'package:flutter/material.dart';
import '../models/plant_model.dart';
import 'cultivation_interaction_page.dart'; // 引入培养互动页

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xFFD9F8E7), Color(0xFFF9F7FE)],
          // ),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  plant.enName,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),

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
                      child: Text(
                        plant.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1.6,
                        ),
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
                    margin: const EdgeInsets.only(bottom: 32),
                    width: 120,
                    height: 120, // 增大高度使按钮成为圆形
                    child: ElevatedButton(
                      onPressed: () {
                        // 按钮点击事件
                        // 跳转到培养互动页并传递植物信息
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
                        backgroundColor: Colors.white.withOpacity(0.5), // 按钮背景色
                        padding: EdgeInsets.zero, // 去除内边距
                        elevation: 10, // 按钮阴影深度
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
