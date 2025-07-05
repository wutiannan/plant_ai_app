import 'package:flutter/material.dart';

class MapExplorePage extends StatelessWidget {
  final double totalDistance; // 全程距离，单位 km
  final double? remainingDistance; // 距离任务点剩余距离，单位 km（可选，默认等于totalDistance）

  const MapExplorePage({
    Key? key,
    required this.totalDistance,
    this.remainingDistance,
  }) : super(key: key);

  // 计算全程所需时间（分钟）
  int get totalTime => (totalDistance * 15).round();

  // 获取剩余距离，如果未传入则默认等于全程距离
  double get _remainingDistance => remainingDistance ?? totalDistance;

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
          '户外实地探索任务',
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
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 30),
            // 顶部ip + 对话气泡区域
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ip
                  Image.asset(
                    'assets/images/charactor_map.png',
                    width: 169,
                    height: 157,
                  ),
                  const SizedBox(width: 8),
                  // 对话气泡
                  Container(
                    width: 211,
                    height: 139,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/route_tip_bg.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: 30,
                        right: 10,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '雪橇狗，你选择的任务点有机会打卡到神秘植物，打卡成功将获取额外奖励哦！',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '交友组队或亲子协作打卡更有惊喜掉落！',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 灰色占位区域（包含绿色信息栏）
            Expanded(
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // 地图/背景内容
                    Image.asset(
                      'assets/images/map_explore.png', // 替换为实际地图图片
                      fit: BoxFit.cover,
                    ),
                    
                    // 底部绿色信息栏
                    Positioned(
                      bottom: 30,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6EC82A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '全程${totalDistance}km ${totalTime}分钟',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '距离任务点还有${totalDistance}km',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}