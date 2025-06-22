// lib/pages/virtual_garden_page.dart
import 'package:flutter/material.dart';

class VirtualGardenPage extends StatelessWidget {
  VirtualGardenPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _ownedPlants = [
    {
      'name': '栀子花',
      'status': '健康成长中',
      'waterLevel': 75,
      'fertilizerLevel': 40,
      'imageUrl': 'https://picsum.photos/300/300?random=31',
    },
    {
      'name': '草莓',
      'status': '即将结果',
      'waterLevel': 90,
      'fertilizerLevel': 60,
      'imageUrl': 'https://picsum.photos/300/300?random=32',
    },
    {
      'name': '仙人掌',
      'status': '状态良好',
      'waterLevel': 30,
      'fertilizerLevel': 20,
      'imageUrl': 'https://picsum.photos/300/300?random=33',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('来布置你的个性化“植域”吧！')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 花园预览
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/800/400?random=3'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '雪椰的花园',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '今日活跃度: 85%',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 功能按钮
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _GardenActionButton(icon: Icons.add, label: '添加植物'),
                  _GardenActionButton(icon: Icons.edit, label: '布置花园'),
                  _GardenActionButton(icon: Icons.auto_awesome, label: '花园美化'),
                  _GardenActionButton(icon: Icons.share, label: '分享花园'),
                ],
              ),
            ),
            // 我的植物
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '我的植物',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _ownedPlants.length,
              itemBuilder: (context, index) {
                final plant = _ownedPlants[index];
                return _PlantItem(plant: plant);
              },
            ),
            // 养护提醒
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                '养护提醒',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.notifications, color: Colors.green),
                  title: Text('今日需要浇水的植物'),
                  subtitle: Text('栀子花、草莓'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _GardenActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GardenActionButton({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(icon, size: 32, color: Colors.green),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class _PlantItem extends StatelessWidget {
  final Map<String, dynamic> plant;

  const _PlantItem({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  plant['imageUrl'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '状态: ${plant['status']}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '水分',
                                  style: TextStyle(fontSize: 12),
                                ),
                                LinearProgressIndicator(
                                  value: plant['waterLevel'] / 100,
                                  backgroundColor: Colors.grey[200],
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '肥料',
                                  style: TextStyle(fontSize: 12),
                                ),
                                LinearProgressIndicator(
                                  value: plant['fertilizerLevel'] / 100,
                                  backgroundColor: Colors.grey[200],
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 浇水逻辑
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('浇水'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // 施肥逻辑
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('施肥'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
