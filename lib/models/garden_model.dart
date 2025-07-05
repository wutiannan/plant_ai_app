class GardenModel {
  final String name;
  final String image;
  final String description;
  final String price;
  final bool isCollected;
  final bool isWishlist;
  bool isInCart; // 新增购物车状态属性

  GardenModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    this.isCollected = false,
    this.isWishlist = false,
    this.isInCart = false, // 默认值为false
  });
}

// 模拟花园数据
final List<GardenModel> gardenData = [
  GardenModel(
    name: '海边花园',
    image: 'assets/images/garden_seaside.png',
    description: '玩家将探索一片生机盎然的海边花园。这里四季如春，繁花似锦，蝴蝶翩翩起舞，海浪轻拍岸边，带来阵阵清凉。',
    price: '500',
    isCollected: false,
    isWishlist: false,
  ),
  GardenModel(
    name: '悬浮岛屿',
    image: 'assets/images/garden_floating_island.png',
    description: '悬浮岛屿是一片神秘的天地。岛屿漂浮在云端之上，四周环绕着绚丽的极光和流动的星河。',
    price: '800',
    isCollected: false,
    isWishlist: false,
  ),
  GardenModel(
    name: '星空花园',
    image: 'assets/images/garden_starlit_sky.png',
    description: '星空花园是一片神秘而美丽的场景。这里繁星点点，银河如练，各种奇异的植物在星光下生长，绽放出梦幻般的光彩。',
    price: '800',
    isCollected: false,
    isWishlist: false,
  ),
  GardenModel(
    name: '欧式花园',
    image: 'assets/images/garden_european.png',
    description: '欧式花园场景以其精致典雅著称。这里绿树成荫，花香四溢，喷泉潺潺，雕塑点缀其间，仿佛步入了一个童话世界。',
    price: '800',
    isCollected: false,
    isWishlist: false,
  ),
];
