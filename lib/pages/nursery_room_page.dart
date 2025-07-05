import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/plant_detail_page.dart';
import 'package:plant_ai_app/pages/plant_model.dart';
import 'package:plant_ai_app/pages/plant_illustrations_page.dart'
    hide Plant; // 导入花园页

class NurseryRoomPage extends StatelessWidget {
  const NurseryRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/main_icon_back.png',
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '培育房',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
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
      body: SafeArea(
        child: Column(
          children: [
            // 植物列表区域：占满剩余空间，滚动自适应
            Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Container(
                  height: 621,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/plant_nursery_bg.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    // padding: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                            ),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: plants.length,
                        itemBuilder: (context, index) {
                          final plant = plants[index];
                          return _PlantCard(
                            plant: plant,
                            onTap: () {
                              // 点击卡片跳转至详情页
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PlantDetailPage(plant: plant),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 底部按钮区域：固定高度，独立于滚动
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              // color: Colors.white, // 与页面背景一致
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BottomButton(
                    title: '进入花园',
                    image: 'assets/images/plant_btn.png',
                    onTap: () {
                      // // 点击进入花园
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantIllustrationsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 24),
                  _BottomButton(
                    title: '前往兑换',
                    image: 'assets/images/plant_btn.png',
                    onTap: () {
                      // 跳转逻辑
                    },
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

// 植物卡片组件
class _PlantCard extends StatelessWidget {
  final Plant plant;
  final VoidCallback onTap;

  const _PlantCard({required this.plant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            // padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   color: Colors.white.withOpacity(0.9),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: Column(
              children: [
                Text(plant.name, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                SizedBox(
                  width: 50,
                  height: 3,
                  child: LinearProgressIndicator(
                    value: plant.progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 56,
                  height: 80,
                  child: ClipRRect(
                    child: Image.asset(plant.image, fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 6,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _BottomButton({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 0, 0, 0),
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // 水平居中
        ),
      ),
    );
  }
}
