import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OutdoorExplorePage extends StatefulWidget {
  const OutdoorExplorePage({Key? key}) : super(key: key);

  @override
  State<OutdoorExplorePage> createState() => _OutdoorExplorePageState();
}

class _OutdoorExplorePageState extends State<OutdoorExplorePage> {
  late GoogleMapController _mapController;
  Location _location = Location();
  Set<Marker> _markers = {};
  CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(30.67, 104.06), // 默认位置（成都）
    zoom: 14,
  );
  String _currentRegion = "成都市金牛区";
  double _nearestTaskDistance = 1.1; // 单位：km
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initLocation();
    _loadTaskPoints();
  }

  // 初始化位置信息
  Future<void> _initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await _location.getLocation();
    setState(() {
      _initialPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 14,
      );
      _isLoading = false;
    });

    // 添加当前位置标记
    _addMarker(
      id: 'current_position',
      position: LatLng(locationData.latitude!, locationData.longitude!),
      title: '当前位置',
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );
  }

  // 加载任务点数据
  void _loadTaskPoints() {
    // 模拟加载附近任务点
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _addMarker(
          id: 'task_point_1',
          position: const LatLng(30.675, 104.065),
          title: '公园探索任务',
          snippet: '发现公园中的隐藏景点',
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        _addMarker(
          id: 'task_point_2',
          position: const LatLng(30.68, 104.05),
          title: '历史建筑任务',
          snippet: '了解本地历史文化',
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          ),
        );
        _addMarker(
          id: 'task_point_3',
          position: const LatLng(30.66, 104.07),
          title: '自然观察任务',
          snippet: '观察本地动植物',
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueViolet,
          ),
        );
      });
    });
  }

  // 添加地图标记
  void _addMarker({
    required String id,
    required LatLng position,
    required String title,
    String? snippet,
    BitmapDescriptor? icon,
  }) {
    _markers.add(
      Marker(
        markerId: MarkerId(id),
        position: position,
        infoWindow: InfoWindow(title: title, snippet: snippet),
        icon: icon ?? BitmapDescriptor.defaultMarker,
      ),
    );
  }

  // 切换地图样式
  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/dark_mode.json'); // 需要在assets中添加样式文件
    _mapController.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('户外实地探索任务'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 通知功能
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 搜索栏
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: '搜索位置或任务',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      // 搜索功能
                    },
                  ),
                ),
                // 区域信息
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        '附近',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '该区域属于：$_currentRegion',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      Text(
                        '最近任务点距离：$_nearestTaskDistance km',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                // 地图区域
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: _initialPosition,
                    mapType: MapType.normal,
                    markers: _markers,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
                  ),
                ),
                // 底部任务列表
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '附近任务点',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final taskPoints = [
                              {
                                'title': '公园探索任务',
                                'distance': '1.1km',
                                'difficulty': '简单',
                                'reward': '100积分',
                              },
                              {
                                'title': '历史建筑任务',
                                'distance': '2.3km',
                                'difficulty': '中等',
                                'reward': '250积分',
                              },
                              {
                                'title': '自然观察任务',
                                'distance': '3.5km',
                                'difficulty': '困难',
                                'reward': '500积分',
                              },
                            ];
                            final task = taskPoints[index];
                            return Container(
                              width: 200,
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green[100],
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Text(
                                          task['difficulty']!,
                                          style: TextStyle(
                                            color: Colors.green[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        task['distance']!,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    task['title']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        task['reward']!,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      // 地图控制按钮
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: _toggleMapStyle,
            child: const Icon(Icons.map),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialPosition),
              );
            },
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () {
              setState(() {
                _isLoading = true;
                _loadTaskPoints();
                _isLoading = false;
              });
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
