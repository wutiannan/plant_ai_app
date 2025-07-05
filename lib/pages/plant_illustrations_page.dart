import 'package:flutter/material.dart';
import 'package:plant_ai_app/models/plant_model.dart';

class PlantIllustrationsPage extends StatefulWidget {
  const PlantIllustrationsPage({super.key});

  @override
  State<PlantIllustrationsPage> createState() => _PlantIllustrationsPageState();
}

class _PlantIllustrationsPageState extends State<PlantIllustrationsPage>
    with TickerProviderStateMixin {
  String _selectedCategory = '全部';
  List<Plant> _displayedPlants = [...plants];
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    _filterPlants();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    _filterPlants();
  }

  void _filterPlants() {
    List<Plant> filtered = [];

    // 根据当前选中的标签页筛选
    switch (_tabController.index) {
      case 0: // 全部
        filtered = plants
            .where(
              (p) =>
                  (_selectedCategory == '全部' ||
                  p.category == _selectedCategory),
            )
            .toList();
        break;
      case 1: // 已收集
        filtered = plants
            .where(
              (p) =>
                  p.isCollected &&
                  (_selectedCategory == '全部' ||
                      p.category == _selectedCategory),
            )
            .toList();
        break;
      case 2: // 心愿单
        filtered = plants
            .where(
              (p) =>
                  p.isWishlist &&
                  (_selectedCategory == '全部' ||
                      p.category == _selectedCategory),
            )
            .toList();
        break;
    }

    // 应用搜索过滤
    final searchQuery = _searchController.text.toLowerCase();
    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) =>
                p.name.toLowerCase().contains(searchQuery) ||
                p.description.toLowerCase().contains(searchQuery),
          )
          .toList();
    }

    setState(() {
      _displayedPlants = filtered;
    });
  }

  void _onSearchChanged(String query) {
    _filterPlants();
  }

  void _toggleCollection(Plant plant) {
    setState(() {
      plant.isCollected = !plant.isCollected;
      _filterPlants();
    });
  }

  void _toggleWishlist(Plant plant) {
    setState(() {
      plant.isWishlist = !plant.isWishlist;
      _filterPlants();
    });
  }

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
            width: 22,
            height: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '植物图鉴',
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
      body: Column(
        children: [
          // 搜索栏
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: '搜索植物或分类',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tab栏 - 绿色下划线指示器
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: const Color(0xFF999999),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.green),
                // insets: EdgeInsets.symmetric(horizontal: 16), // 左右间距
              ),
              tabs: const [
                Tab(text: '全部'),
                Tab(text: '已收集'),
                Tab(text: '心愿单'),
              ],
            ),
          ),

          // 主内容区域（包含侧边栏和内容区）添加底图
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/sidebar_bg.png'),
                  fit: BoxFit.cover,
                  // opacity: 0.1, // 调整底图透明度
                ),
              ),
              child: Row(
                children: [
                  // 分类侧边栏
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    width: 84,
                    color: Colors.transparent, // 透明背景
                    child: ListView.builder(
                      itemCount: _getCategories().length,
                      itemBuilder: (context, index) {
                        final category = _getCategories()[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = category;
                              _filterPlants();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/illustrations_active.png',
                                ),
                                fit: BoxFit.cover,
                                opacity: _selectedCategory == category
                                    ? 1
                                    : 0, // opacity: 0.1, // 调整底图透明度
                              ),
                              // color: _selectedCategory == category
                              //     ? Colors.green.withOpacity(0.3)
                              //     : Colors.transparent,
                            ),
                            child: Text(
                              category,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // 植物列表内容区
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),

                      child: _displayedPlants.isEmpty
                          ? const Center(child: Text('没有找到匹配的植物'))
                          : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: _displayedPlants.length,
                              itemBuilder: (context, index) {
                                final plant = _displayedPlants[index];
                                return _buildPlantCard(plant);
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getCategories() {
    final categories = <String>{'全部'};
    categories.addAll(plants.map((p) => p.category));
    return categories.toList();
  }

  Widget _buildPlantCard(Plant plant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     blurRadius: 5,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
        image: DecorationImage(
          image: AssetImage('assets/images/illustrations_card_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 植物信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  plant.description,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                const SizedBox(height: 4),

                // 状态图标
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        plant.isCollected
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: Colors.black,
                      ),
                      onPressed: () => _toggleCollection(plant),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                    ),
                    // const SizedBox(width: 5),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: plant.isWishlist
                            ? Colors.red
                            : const Color(0xFFEFEFEF),
                      ),
                      onPressed: () => _toggleWishlist(plant),
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // 植物图片
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              plant.image,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
