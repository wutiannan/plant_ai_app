import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_ai_app/models/home_card_model.dart';
import 'package:plant_ai_app/models/home_banner_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  // 自动轮播逻辑
  void _startAutoPlay() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _currentBannerIndex = (_currentBannerIndex + 1) % bannerList.length;
        });
        _startAutoPlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部安全区适配
                SizedBox(height: MediaQuery.of(context).padding.top - 20),

                // 顶部栏：菜单 + 头像
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/main_icon_menu.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                const Text('欢迎回来，看极光的雪橇狗！', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                const Text(
                  '今日运动量为360kcal',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 24),

                // 功能按钮 + 植物形象
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 179,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/home_kepu_btn.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 179,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/home_tansuo_btn.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 66),
                    Image.asset(
                      'assets/images/charactor.png',
                      width: 120,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // 轮播图区域（图文同步变化）
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      // 手势滑动控制
                      GestureDetector(
                        onHorizontalDragEnd: (details) {
                          // 左滑切换到下一张
                          if (details.primaryVelocity! < 0) {
                            setState(
                              () => _currentBannerIndex =
                                  (_currentBannerIndex + 1) % bannerList.length,
                            );
                          }
                          // 右滑切换到上一张
                          else if (details.primaryVelocity! > 0) {
                            setState(
                              () => _currentBannerIndex =
                                  (_currentBannerIndex -
                                      1 +
                                      bannerList.length) %
                                  bannerList.length,
                            );
                          }
                        },
                        child: Stack(
                          children: bannerList.map((banner) {
                            final index = bannerList.indexOf(banner);
                            return Positioned.fill(
                              child: Opacity(
                                // 只显示当前索引的轮播项
                                opacity: index == _currentBannerIndex ? 1 : 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // 轮播图点击逻辑（可根据当前banner跳转不同页面）
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(banner.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // 轮播标题
                                          Text(
                                            banner.title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,

                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          // 轮播描述
                                          Text(
                                            banner.desc,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              height: 1.4,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          // 轮播按钮
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF6EC82A),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              banner.buttonText,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      // 轮播指示器
                      Positioned(
                        bottom: 12,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < bannerList.length; i++)
                              Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: i == _currentBannerIndex
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 瀑布流卡片区域
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: cardList.map((cardData) {
                    return StaggeredGridTile.fit(
                      crossAxisCellCount: cardData.crossAxisCellCount,
                      child: _buildCard(cardData),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 卡片组件
  Widget _buildCard(CardDataModel cardData) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  cardData.imagePath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/home_icon_star.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/home_icon_heart.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/home_icon_comment.png',
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardData.title, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text(
                  cardData.desc,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
