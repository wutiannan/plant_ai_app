// 模拟周边数据
class PeripheralModel {
  final String name;
  final String image;
  final int price;
  final bool isWishlist;

  PeripheralModel({
    required this.name,
    required this.image,
    required this.price,
    this.isWishlist = false,
  });
}

final List<PeripheralModel> peripheralData = [
  PeripheralModel(
    name: '植物种子',
    image: 'assets/images/peripheral_plant_seed.png',
    price: 200,
    isWishlist: false,
  ),
  PeripheralModel(
    name: '定制卡片',
    image: 'assets/images/peripheral_custom_card.png',
    price: 100,
    isWishlist: false,
  ),
  PeripheralModel(
    name: '植域周边玩具',
    image: 'assets/images/peripheral_toy.png',
    price: 1800,
    isWishlist: false,
  ),
  PeripheralModel(
    name: '文具',
    image: 'assets/images/peripheral_stationery.png',
    price: 200,
    isWishlist: false,
  ),
  PeripheralModel(
    name: '小台灯',
    image: 'assets/images/peripheral_lamp.png',
    price: 100,
    isWishlist: false,
  ),
];
