import 'package:flutter/material.dart';

class PlantIllustrationsPage extends StatefulWidget {
  const PlantIllustrationsPage({Key? key}) : super(key: key);

  @override
  State<PlantIllustrationsPage> createState() => _PlantIllustrationsPageState();
}

class _PlantIllustrationsPageState extends State<PlantIllustrationsPage> {
  // 分类选中状态
  String _selectedCategory = '全部';
  // Tab选中状态
  String _selectedTab = '全部';
  // 植物数据（含收藏、心愿单状态）
  final List<Plant> _plants = [
    Plant(
      name: '蝴蝶兰',
      desc: '蝴蝶兰又名蝶兰，花期4—6月...',
      image: 'assets/images/plant_butterfly_orchid.png',
      category: '鲜花',
      isCollected: true,
      isWishlist: false,
    ),
    Plant(
      name: '栀子花',
      desc: '为茜草科、栀子属灌木植物...',
      image: 'assets/images/plant_gardenia.png',
      category: '灌木',
      isCollected: true,
      isWishlist: false,
    ),
    Plant(
      name: '草莓',
      desc: '为蔷薇科草莓属多年生草本植物...',
      image: 'assets/images/plant_strawberry.png',
      category: '蔬菜',
      isCollected: true,
      isWishlist: false,
    ),
    Plant(
      name: '郁金香',
      desc: '百合科郁金香属多年生球根花卉...',
      image: 'assets/images/plant_tulip.png',
      category: '鲜花',
      isCollected: true,
      isWishlist: false,
    ),
    Plant(
      name: '牡丹',
      desc: '是芍药科、芍药属植物...',
      image: 'assets/images/plant_peony.png',
      category: '鲜花',
      isCollected: false,
      isWishlist: false,
    ),
  ];

  // 筛选植物列表
  List<Plant> _filteredPlants() {
    List<Plant> result = [];
    // 按分类筛选
    if (_selectedCategory == '全部') {
      result = _plants;
    } else {
      result = _plants.where((p) => p.category == _selectedCategory).toList();
    }
    // 按Tab筛选
    if (_selectedTab == '已收集') {
      result = result.where((p) => p.isCollected).toList();
    } else if (_selectedTab == '心愿单') {
      result = result.where((p) => p.isWishlist).toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5FFFA),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/main_icon_back.png',
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '植物图鉴',
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
      body: Column(
        children: [
          // 搜索栏 + 分类标签（顶部区域）
          Column(
            children: [
              // 搜索栏
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '搜索栏：搜索你想找的植物或分类',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                          ),
                        ),
                      ),
                      // 搜索按钮在右侧
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFAFFF9F),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/plant_search_icon.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 分类标签
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _TabItem(
                      title: '全部',
                      isActive: _selectedTab == '全部',
                      onTap: () => setState(() => _selectedTab = '全部'),
                    ),
                    _TabItem(
                      title: '已收集',
                      isActive: _selectedTab == '已收集',
                      onTap: () => setState(() => _selectedTab = '已收集'),
                    ),
                    _TabItem(
                      title: '心愿单',
                      isActive: _selectedTab == '心愿单',
                      onTap: () => setState(() => _selectedTab = '心愿单'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 主体内容区（左侧分类菜单 + 右侧列表）
          Expanded(
            child: Row(
              children: [
                // 左侧分类菜单（固定样式）
                Container(
                  width: 90,
                  color: const Color(0xFFAFFF9F),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _CategoryItem(
                        title: '全部',
                        isSelected: _selectedCategory == '全部',
                        onTap: () => setState(() => _selectedCategory = '全部'),
                      ),
                      _CategoryItem(
                        title: '灌木',
                        isSelected: _selectedCategory == '灌木',
                        onTap: () => setState(() => _selectedCategory = '灌木'),
                      ),
                      _CategoryItem(
                        title: '藤类',
                        isSelected: _selectedCategory == '藤类',
                        onTap: () => setState(() => _selectedCategory = '藤类'),
                      ),
                      _CategoryItem(
                        title: '树木',
                        isSelected: _selectedCategory == '树木',
                        onTap: () => setState(() => _selectedCategory = '树木'),
                      ),
                      _CategoryItem(
                        title: '蕨类',
                        isSelected: _selectedCategory == '蕨类',
                        onTap: () => setState(() => _selectedCategory = '蕨类'),
                      ),
                      _CategoryItem(
                        title: '地衣',
                        isSelected: _selectedCategory == '地衣',
                        onTap: () => setState(() => _selectedCategory = '地衣'),
                      ),
                      _CategoryItem(
                        title: '鲜花',
                        isSelected: _selectedCategory == '鲜花',
                        onTap: () => setState(() => _selectedCategory = '鲜花'),
                      ),
                      _CategoryItem(
                        title: '水生',
                        isSelected: _selectedCategory == '水生',
                        onTap: () => setState(() => _selectedCategory = '水生'),
                      ),
                      _CategoryItem(
                        title: '蔬菜',
                        isSelected: _selectedCategory == '蔬菜',
                        onTap: () => setState(() => _selectedCategory = '蔬菜'),
                      ),
                    ],
                  ),
                ),
                // 右侧植物列表
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: _filteredPlants()
                        .map(
                          (plant) => _PlantItem(
                            plant: plant,
                            onCollect: () => setState(() {
                              plant.isCollected = !plant.isCollected;
                            }),
                            onWishlist: () => setState(() {
                              plant.isWishlist = !plant.isWishlist;
                            }),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 植物数据模型
class Plant {
  String name;
  String desc;
  String image;
  String category;
  bool isCollected;
  bool isWishlist;

  Plant({
    required this.name,
    required this.desc,
    required this.image,
    required this.category,
    required this.isCollected,
    required this.isWishlist,
  });
}

// 左侧分类项组件（含交互）
class _CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF5FFFA) : null,
          borderRadius: isSelected
              ? const BorderRadius.horizontal(right: Radius.circular(12))
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// 分类标签组件（含交互）
class _TabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  //     @override
  //   Widget build(BuildContext context) {
  //     return Container(
  //       margin: const EdgeInsets.right(16),
  //       padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  //       decoration: BoxDecoration(
  //         color: isActive ? const Color(0xFF77DD77) : Colors.white,
  //         borderRadius: BorderRadius.circular(12),
  //         border: Border.all(
  //           color: const Color(0xFF77DD77),
  //         ),
  //       ),
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //           color: isActive ? Colors.white : const Color(0xFF77DD77),
  //           fontSize: 14,
  //         ),
  //       ),
  //     );
  //   }

  // // 分类标签组件
  // class _TabItem extends StatelessWidget {
  //   final String title;
  //   final bool isActive;

  //   const _TabItem({required this.title, this.isActive = false});

  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: isActive
                ? const Border(
                    bottom: BorderSide(color: Color(0xFFAFFF9F), width: 2),
                  )
                : null,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? Colors.black : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

// 植物列表项组件（含交互）
class _PlantItem extends StatelessWidget {
  final Plant plant;
  final VoidCallback onCollect;
  final VoidCallback onWishlist;

  const _PlantItem({
    required this.plant,
    required this.onCollect,
    required this.onWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 文字内容
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
                  plant.desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    // height: 1.2,
                  ),
                  // maxLines: 3,
                  // overflow: TextOverflow.ellipsis,
                ),
                // 收藏按钮（黑色勾勾）
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onCollect,
                      child: Container(
                        // width: 12,
                        margin: const EdgeInsets.only(right: 8),
                        child: Icon(
                          plant.isCollected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: plant.isCollected ? Colors.black : Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    // 心形按钮（心愿单）
                    GestureDetector(
                      onTap: onWishlist,
                      child: Icon(
                        plant.isWishlist
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: plant.isWishlist ? Colors.pink : Colors.grey,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 植物图片
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              plant.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

// // 植物列表项组件
// class _PlantItem extends StatelessWidget {
//   final String title;
//   final String desc;
//   final String imagePath;
//   final bool isCollected;

//   const _PlantItem({
//     required this.title,
//     required this.desc,
//     required this.imagePath,
//     required this.isCollected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 植物图片
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               imagePath,
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 12),
//           // 文字内容 + 操作按钮
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 标题
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 // 描述
//                 Text(
//                   desc,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                     height: 1.4,
//                   ),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 // 收藏按钮
//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(
//                       isCollected
//                           ? Icons.check_circle_outline
//                           : Icons.circle_outlined,
//                       color: isCollected ? Colors.green : Colors.grey,
//                       size: 18,
//                     ),
//                     Icon(
//                       Icons.favorite_border,
//                       color: isCollected ? Colors.pink : Colors.grey,
//                       size: 18,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
