import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/plant_detail_page.dart';
import 'package:plant_ai_app/models/plant_model.dart';
import 'package:plant_ai_app/pages/shop_page.dart';
import 'package:plant_ai_app/pages/garden_page.dart';

class NurseryRoomPage extends StatelessWidget {
  const NurseryRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          // 固定背景
          Container(height: double.infinity),

          // 内容区域
          Column(
            children: [
              // 按钮区域
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  // horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _BottomButton(
                      title: '进入花园',
                      image: 'assets/images/left_btn_bg.png',
                      onTap: () {
                        // 点击进入花园
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GardenPage()),
                        );
                      },
                    ),
                    _BottomButton(
                      title: '前往兑换',
                      image: 'assets/images/right_btn_bg.png',
                      onTap: () {
                        // 跳转逻辑
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShopPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // 卡片区域，增加边距
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/plant_nursery_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
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
            ],
          ),
        ],
      ),
    );
  }
}

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
          Text(plant.name, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          SizedBox(
            width: 50,
            height: 3,
            child: LinearProgressIndicator(
              value: plant.progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
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
          Container(width: double.infinity, height: 6, color: Colors.white),
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
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          // borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
