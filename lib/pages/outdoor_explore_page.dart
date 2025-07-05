import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/map_explore_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: OutdoorExplorePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class OutdoorExplorePage extends StatefulWidget {
  const OutdoorExplorePage({Key? key}) : super(key: key);

  @override
  _OutdoorExplorePageState createState() => _OutdoorExplorePageState();
}

class _OutdoorExplorePageState extends State<OutdoorExplorePage> {
  TaskPoint? selectedTaskPoint;
  String _areaInfo = '该区域属于：成都市金牛区  最近任务点距离：1.1km';

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
            SizedBox(height: MediaQuery.of(context).padding.top + 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '搜索你想去的位置查看是否有任务点',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF46D7E7),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Text(
              _areaInfo,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/map_background.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    left: 160,
                    bottom: 80,
                    child: CurrentLocationMarker(),
                  ),
                  ..._buildTaskPoints(),
                  if (selectedTaskPoint != null)
                    Positioned(
                      left: 60,
                      top: 180,
                      child: TaskInfoCard(
                        distance: selectedTaskPoint!.distance,
                        onClose: () {
                          setState(() {
                            selectedTaskPoint = null;
                            _areaInfo = '该区域属于：成都市金牛区  最近任务点距离：1.1km';
                          });
                        },
                      ),
                    ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Column(
                      children: [
                        _buildActionButton(Icons.layers, '图层'),
                        const SizedBox(height: 12),
                        _buildActionButton(Icons.navigation, '方向'),
                        const SizedBox(height: 12),
                        _buildActionButton(Icons.list, '任务列表'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTaskPoints() {
    final taskPoints = [
      TaskPoint(
        x: 0.4,
        y: 0.1,
        distance: 4.2,
        areaInfo: '总路程：4.2km  总时长：2.2h  收集植物：9种',
      ),
      TaskPoint(
        x: 0.6,
        y: 0.4,
        distance: 3.1,
        areaInfo: '总路程：3.1km  总时长：1.8h  收集植物：5种',
      ),
      TaskPoint(
        x: 0.4,
        y: 0.6,
        distance: 1.1,
        areaInfo: '总路程：1.1km  总时长：0.8h  收集植物：8种',
      ),
      TaskPoint(
        x: 0.7,
        y: 0.7,
        distance: 2.1,
        areaInfo: '总路程：2.1km  总时长：1.7h  收集植物：6种',
      ),
      TaskPoint(
        x: 0.2,
        y: 0.5,
        distance: 1.9,
        areaInfo: '总路程：1.9km  总时长：1.0h  收集植物：4种',
      ),
    ];

    return taskPoints.map((point) {
      return Positioned(
        left: MediaQuery.of(context).size.width * point.x - 8,
        top: MediaQuery.of(context).size.height * point.y - 8,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedTaskPoint = point;
              _areaInfo = point.areaInfo;
            });
          },
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF46D7E7),
            ),
          ),
        ),
      );
    }).toList();
  }

  // 右下角按钮颜色改为绿色（核心修改点）
  Widget _buildActionButton(IconData icon, String tooltip) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: const Color(0xFF00D909)),
        onPressed: () {},
      ),
    );
  }
}

class TaskPoint {
  final double x;
  final double y;
  final double distance;
  final String areaInfo;

  TaskPoint({
    required this.x,
    required this.y,
    required this.distance,
    required this.areaInfo,
  });
}

class CurrentLocationMarker extends StatelessWidget {
  const CurrentLocationMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/current_location_bg.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('当前位置', style: TextStyle(fontSize: 12)),
        ),
        // const SizedBox(height: 4),
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFEFF04),
          ),
        ),
      ],
    );
  }
}

class TaskInfoCard extends StatelessWidget {
  final double distance;
  final VoidCallback onClose;

  const TaskInfoCard({Key? key, required this.distance, required this.onClose})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/plant2.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/plant1.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/plant3.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '这里生长着多种珍稀植物，完成采集任务可丰富你的植物图鉴！',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF46D7E7), size: 18),
              const SizedBox(width: 4),
              Text(
                '距离当前位置: $distance km',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // 假设这是前一个页面的跳转代码
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MapExplorePage(totalDistance: distance),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF46D7E7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('前往任务点', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
