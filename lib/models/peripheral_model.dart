// 模拟周边数据
class PeripheralModel {
  final String name;
  final String image;
  final String description;
  final int price;
  final bool isCollected;
  final bool isWishlist;
  bool isInCart; // 新增购物车状态属性

  PeripheralModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.isCollected,
    this.isWishlist = false,
    this.isInCart = false, // 默认值为false
  });
}

final List<PeripheralModel> peripheralData = [
  PeripheralModel(
    name: '植物种子',
    image: 'assets/images/peripheral_plant_seed.png',
    description: '可培育出多种植物的神奇种子，开启种植新体验。',
    price: 200,
    isCollected: false,
    isWishlist: false,
  ),
  PeripheralModel(
    name: '定制卡片',
    image: 'assets/images/peripheral_custom_card.png',
    description: '印有精美植物图案的定制卡片，可作收藏或送礼。',
    price: 100,
    isCollected: false,
    isWishlist: false,
  ),
  // 继续补充其他周边数据...
];
