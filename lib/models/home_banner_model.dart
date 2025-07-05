// 轮播图数据模型（统一管理图片和文字）
class BannerModel {
  final String imagePath;
  final String title;
  final String desc;
  final String buttonText;

  BannerModel({
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.buttonText,
  });
} // 轮播图数据（包含图片和对应文字）

final List<BannerModel> bannerList = [
  BannerModel(
    imagePath: 'assets/images/home_huodong_1.png',
    title: '共赴山海',
    desc: '组成10个家庭团，7天6夜自然零距离\n目的地：泸沽湖\n报名截止2025年6月1日',
    buttonText: '前往报名',
  ),
  BannerModel(
    imagePath: 'assets/images/home_huodong_2.png',
    title: '一叶知秋',
    desc: '适合人群：亲子家庭组成5个家庭团，5天4夜自然零距离\n目的地光雾山\n报名截止2025年7月1日',
    buttonText: '前往报名',
  ),
];
