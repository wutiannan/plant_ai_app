import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OutdoorExplorePage extends StatefulWidget {
  const OutdoorExplorePage({Key? key}) : super(key: key);

  @override
  State<OutdoorExplorePage> createState() => _OutdoorExplorePageState();
}

class _OutdoorExplorePageState extends State<OutdoorExplorePage> {
  // 地图控制器
  late GoogleMapController mapController;
  // 标记集合，模拟任务点，实际可从接口获取
  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('taskPoint1'),
      position: const LatLng(30.65, 104.06), // 模拟成都金牛区附近经纬度，需替换真实坐标
      infoWindow: const InfoWindow(title: '任务点1'),
    ),
    Marker(
      markerId: const MarkerId('taskPoint2'),
      position: const LatLng(30.66, 104.07),
      infoWindow: const InfoWindow(title: '任务点2'),
    ),
  };
  // 搜索控制器
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('户外实地探索任务')),
      body: Column(
        children: [
          // 搜索栏
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索你想去的位置查看是否有任务点',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                // 这里可实现根据搜索内容查询任务点逻辑，比如调用接口
                debugPrint('搜索内容：$value');
              },
            ),
          ),
          // 地图区域
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(30.65, 104.06), // 初始定位到成都金牛区附近，可根据实际调整
                zoom: 12,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: _markers,
            ),
          ),
          // 底部信息栏，可展示区域、最近任务点距离等
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: const Row(
              children: [
                Text('该区域属于：成都市金牛区'),
                SizedBox(width: 16),
                Text('最近任务点距离：1.1km'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
