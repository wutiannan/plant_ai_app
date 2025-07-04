class GardenModel {
  final String name;
  final String image;
  final String description;
  final int price;
  final bool isCollected;
  final bool isWishlist;
  bool isInCart; // 新增购物车状态属性

  GardenModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.isCollected,
    this.isWishlist = false,
    this.isInCart = false, // 默认值为false
  });
}

// 模拟花园数据
final List<GardenModel> gardenData = [
  GardenModel(
    name: '海边花园',
    image: 'assets/images/garden_seaside.png',
    description: '充满海风气息的花园，各类滨海植物错落分布，漫步其中仿佛能听见海浪声。',
    price: 500,
    isCollected: false,
    isWishlist: false,
  ),
  GardenModel(
    name: '悬浮岛屿花园',
    image: 'assets/images/garden_floating_island.png',
    description: '奇幻的空中花园，花朵与绿植在悬浮岛屿上肆意生长，宛如童话世界。',
    price: 800,
    isCollected: false,
    isWishlist: false,
  ),
  // 继续补充其他花园数据...
];
