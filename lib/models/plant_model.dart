class Plant {
  final String name;
  final String enName;
  final String image;
  final double progress;
  final String description;
  final String category;
  bool isCollected;
  bool isWishlist;
  bool isInCart; 
  final double price;
  final String cultivationDifficulty; 

  Plant({
    required this.name,
    required this.enName,
    required this.image,
    required this.progress,
    required this.description,
    required this.category,
    required this.isCollected,
    this.isWishlist = false,
    required this.price,
    this.isInCart = false, 
    required this.cultivationDifficulty, 
  });
}

List<Plant> plants = [
  Plant(
    name: '多肉',
    enName: 'SUCCULENT',
    image: 'assets/images/plant_succulent.png',
    progress: 0.8,
    description:
        '多肉植物也叫多浆植物，是指植物的根、茎、叶三种营养器官中叶是肥厚多汁并且具备储藏大量水分功能的植物。\n\n它们喜欢充足但适度的阳光照射，需要疏松透气、排水良好的土壤，浇水要遵循“干透浇透”的原则。',
    category: '多肉', // 可根据实际归类调整，若截图分类无对应，可保留或自定义
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
  Plant(
    name: '菊花',
    enName: 'CHRYSANTHEMUM',
    image: 'assets/images/plant_chrysanthemum.png',
    progress: 0.6,
    description:
        '菊花是中国十大传统名花、花中四君子之一，具有清寒傲雪的品格。\n\n它喜凉爽、较耐寒，生长适温18 - 21℃，每天14.5小时日照有利于茎叶生长，每天12小时以上黑暗与10℃的夜温适于花芽发育。',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '容易',
  ),
  Plant(
    name: '捕蝇草',
    enName: 'VENUS FLYTRAP',
    image: 'assets/images/plant_venus_flytrap.png',
    progress: 0.7,
    description:
        '捕蝇草是一种非常有趣的食虫植物，它的茎很短，在叶的顶端长有一个酷似“贝壳”的捕虫夹，且能分泌蜜汁。\n\n它喜温暖、湿润和阳光充足的环境，适宜用泥炭土、水苔、珍珠岩等混合配制的基质栽培。',
    category: '食虫植物', 
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '困难',
  ),
  Plant(
    name: '杜鹃',
    enName: 'RHODODENDRON',
    image: 'assets/images/plant_rhododendron.png',
    progress: 0.5,
    description:
        '杜鹃花像会魔法的小喇叭！ 它的花瓣软软的、颜色超丰富，像彩虹落在枝头～（注意！部分野生杜鹃花叶子有毒，欣赏时只摸花瓣就好啦～）',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
  Plant(
    name: '风铃草',
    enName: 'CAMPANULA',
    image: 'assets/images/plant_campanula.png',
    progress: 0.9,
    description: '为桔梗科风铃草属的二年生草本植物，别名钟花、风铃花、挂钟草，花期4 - 6月，果期7 - 9月',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '容易',
  ),
  Plant(
    name: '蝴蝶兰',
    enName: 'BUTTERFLY ORCHID',
    image: 'assets/images/plant_butterfly_orchid.png',
    progress: 0.7,
    description: '又名蝶兰，花期4—6月。蝴蝶兰希腊文的原意为“好似蝴蝶般的兰花”，花姿如蝴蝶飞舞得名。',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
  Plant(
    name: '栀子花',
    enName: 'GARDENIA',
    image: 'assets/images/plant_gardenia.png',
    progress: 0.4,
    description: '茜草科、栀子属灌木植物，花芳香，单朵生于枝顶，花期3~7月，果期5月~翌年2月',
    category: '灌木', 
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '容易',
  ),
  Plant(
    name: '郁金香',
    enName: 'TULIP',
    image: 'assets/images/plant_tulip.png',
    progress: 0.6,
    description: '百合科郁金香属多年生球根花卉，又名草麝香、旱荷花、洋荷花、洋水仙、郁香等花期4 - 5月',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
  Plant(
    name: '牡丹',
    enName: 'PEONY',
    image: 'assets/images/plant_peony.png',
    progress: 0.8,
    description: '是芍药科、芍药属植物,花色泽艳丽，玉笑珠香，花期5月；果期6月',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '困难',
  ),
  Plant(
    name: '仙人掌',
    enName: 'CACTUS',
    image: 'assets/images/plant_cactus.png',
    progress: 0.9,
    description: '仙人掌科仙人掌属草本植物，花碗状，黄色、花大明艳，花期集中在3—5月，果期在6—10月',
    category: '仙人掌类', 
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '容易',
  ),
  Plant(
    name: '鸢尾',
    enName: 'IRIS',
    image: 'assets/images/plant_iris.png',
    progress: 0.5,
    description: '多年生草本植物，草质，边缘膜质，色淡，披针形或长卵圆形，花期4 - 5月，果期6 - 8月',
    category: '鲜花',
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
  Plant(
    name: '含羞草',
    enName: 'MIMOSA',
    image: 'assets/images/plant_mimosa.png',
    progress: 0.7,
    description: '豆科、含羞草属披散、亚灌木状草本植物，花期3 - 10月，果期5 - 11月',
    category: '灌木', 
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '容易',
  ),
 
  Plant(
    name: '草莓',
    enName: 'STRAWBERRY',
    image: 'assets/images/plant_strawberry.png', 
    progress: 0.6,
    description: '为蔷薇科草莓属多年生草本植物，小叶具短柄，倒卵形或菱形，叶柄密被开展黄色柔毛，花期4~5月，果期6~7月',
    category: '蔬菜', 
    isCollected: true,
    isWishlist: false,
    price: 100,
    cultivationDifficulty: '中等',
  ),
];