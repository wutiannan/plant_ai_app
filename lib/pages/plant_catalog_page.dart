import 'package:flutter/material.dart';

class PlantCatalogPage extends StatelessWidget {
  // 由于 plants 字段使用非常量值初始化，移除构造函数中的 const 关键字
  PlantCatalogPage({super.key});

  final List<Map<String, dynamic>> plants = [
    {
      'name': '蝴蝶兰',
      'desc': '蝴蝶兰是一种常见的室内观赏花卉，花朵形如蝴蝶，色彩丰富，花期长...',
      'imageUrl': 'https://picsum.photos/300/300?random=16',
      'difficulty': '中等',
      'watering': '每周1-2次',
      'sunlight': '明亮散射光',
      'temperature': '15-28°C',
    },
    {
      'name': '栀子花',
      'desc': '栀子花是一种芳香花卉，花朵洁白如玉，香气浓郁，适合摆放在室内...',
      'imageUrl': 'https://picsum.photos/300/300?random=17',
      'difficulty': '中等',
      'watering': '保持土壤湿润',
      'sunlight': '充足但避免强光直射',
      'temperature': '18-25°C',
    },
    {
      'name': '多肉植物',
      'desc': '多肉植物是一类茎、叶或根能够贮存水分的植物，种类繁多，形态各异...',
      'imageUrl': 'https://picsum.photos/300/300?random=18',
      'difficulty': '容易',
      'watering': '干透浇透',
      'sunlight': '充足阳光',
      'temperature': '10-30°C',
    },
    {
      'name': '向日葵',
      'desc': '向日葵是一种一年生草本植物，花朵明亮夺目，会随着太阳转动...',
      'imageUrl': 'https://picsum.photos/300/300?random=19',
      'difficulty': '容易',
      'watering': '定期浇水',
      'sunlight': '全日照',
      'temperature': '15-30°C',
    },
    {
      'name': '绿萝',
      'desc': '绿萝是一种常见的室内观叶植物，耐阴性强，能够净化空气...',
      'imageUrl': 'https://picsum.photos/300/300?random=20',
      'difficulty': '容易',
      'watering': '保持土壤湿润',
      'sunlight': '明亮散射光',
      'temperature': '15-30°C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('植物图鉴'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 搜索功能
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetailPage(plant: plant),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(plant['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plant['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            plant['desc'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '养护难度: ${plant['difficulty']}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // 添加到收藏
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 植物图片
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(plant['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 植物信息
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text('养护难度: ${plant['difficulty']}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(plant['desc'], style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 24),

                  // 养护指南
                  const Text(
                    '养护指南',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // 浇水
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '浇水',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              plant['watering'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 光照
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '光照',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              plant['sunlight'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // 温度
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.thermostat, color: Colors.red, size: 32),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '温度',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              plant['temperature'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 领养按钮
                  ElevatedButton(
                    onPressed: () {
                      // 领养逻辑
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('我要领养', style: TextStyle(fontSize: 18)),
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
