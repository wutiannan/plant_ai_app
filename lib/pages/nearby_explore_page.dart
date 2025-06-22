import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/ar_scan_page.dart';

class NearbyExplorePage extends StatelessWidget {
  NearbyExplorePage({super.key});

  final List<Map<String, dynamic>> explorePoints = [
    {
      'name': '城市公园探索点',
      'distance': '1.2公里',
      'description': '位于城市公园内，有多种常见植物和一些珍稀品种',
      'plants': 15,
      'completed': false,
    },
    {
      'name': '校园植物园',
      'distance': '2.5公里',
      'description': '校园内的小型植物园，展示了多种本地植物',
      'plants': 10,
      'completed': true,
    },
    {
      'name': '社区花园',
      'distance': '0.8公里',
      'description': '社区内的公共花园，种植了多种花卉和蔬菜',
      'plants': 8,
      'completed': false,
    },
    {
      'name': '植物园温室',
      'distance': '5.0公里',
      'description': '大型植物园的温室区域，有热带和亚热带植物',
      'plants': 30,
      'completed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('附近探索任务')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 顶部搜索和筛选
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '搜索附近的探索点',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // 筛选功能
                  },
                ),
              ],
            ),
          ),

          // 地图预览（模拟）
          Container(
            height: 200,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Text('地图预览区域'),
          ),

          // 探索点列表
          Expanded(
            child: ListView.builder(
              itemCount: explorePoints.length,
              itemBuilder: (context, index) {
                final point = explorePoints[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              point['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (point['completed'])
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  '已完成',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            const SizedBox(width: 4),
                            Text(point['distance']),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          point['description'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.nature, color: Colors.green),
                            const SizedBox(width: 4),
                            Text('可探索植物: ${point['plants']}种'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (!point['completed'])
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ARScanPage(explorePoint: point),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 40),
                            ),
                            child: const Text('前往探索'),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
