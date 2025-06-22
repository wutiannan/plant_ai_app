// lib/pages/ar_scan_page.dart
import 'package:flutter/material.dart';
import 'dart:math';

class ARScanPage extends StatefulWidget {
  final Map<String, dynamic> explorePoint;

  const ARScanPage({super.key, required this.explorePoint});

  @override
  State<ARScanPage> createState() => _ARScanPageState();
}

class _ARScanPageState extends State<ARScanPage> {
  bool _isScanning = false;
  bool _plantFound = false;
  Map<String, dynamic>? _foundPlant;
  double _scanProgress = 0.0;
  final List<Map<String, dynamic>> _possiblePlants = [
    {
      'name': '樱花',
      'description': '樱花是蔷薇科樱属几种植物的统称，象征着爱情与希望...',
      'imageUrl': 'https://picsum.photos/300/300?random=21',
    },
    {
      'name': '银杏树',
      'description': '银杏树是一种古老的树种，被判为"活化石"...',
      'imageUrl': 'https://picsum.photos/300/300?random=22',
    },
    {
      'name': '竹子',
      'description': '竹子是一种常见的多年生禾本科植物，具有坚韧不拔的品质...',
      'imageUrl': 'https://picsum.photos/300/300?random=23',
    },
  ];

  void _startScanning() {
    setState(() {
      _isScanning = true;
      _plantFound = false;
      _scanProgress = 0.0;
    });

    // 模拟扫描过程
    const duration = Duration(milliseconds: 100);
    final timer = Stream.periodic(duration, (i) => (i + 1) * 0.01)
        .takeWhile((value) => value <= 1.0)
        .listen((value) {
          setState(() {
            _scanProgress = value;
          });

          if (value >= 1.0) {
            // 扫描完成，随机选择一种植物
            final random = Random();
            final index = random.nextInt(_possiblePlants.length);
            setState(() {
              _plantFound = true;
              _foundPlant = _possiblePlants[index];
              _isScanning = false;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.explorePoint['name']),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // 显示探索点信息
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // AR 背景（模拟）
          Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _isScanning
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              const Icon(
                                Icons.camera_alt,
                                size: 64,
                                color: Colors.white,
                              ),
                              CircularProgressIndicator(
                                value: _scanProgress,
                                color: Colors.green,
                                strokeWidth: 4,
                              ),
                            ],
                          )
                        : const Icon(
                            Icons.camera_alt,
                            size: 64,
                            color: Colors.white,
                          ),
                  ),
                  const SizedBox(height: 24),
                  if (_isScanning)
                    Column(
                      children: [
                        Text(
                          '扫描中...${(_scanProgress * 100).round()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '请将摄像头对准植物',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // 底部操作栏
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                children: [
                  if (_plantFound && _foundPlant != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                _foundPlant!['imageUrl'],
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
                                      _foundPlant!['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _foundPlant!['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // 添加到图鉴
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.green,
                                    side: const BorderSide(color: Colors.green),
                                  ),
                                  child: const Text('添加到图鉴'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // 了解更多
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('了解更多'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (!_plantFound)
                    ElevatedButton(
                      onPressed: _isScanning ? null : _startScanning,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(_isScanning ? '扫描中...' : '开始扫描植物'),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
