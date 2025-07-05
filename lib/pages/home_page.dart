import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                SizedBox(height: MediaQuery.of(context).padding.top-20),
                // 顶部栏
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
                const Text(
                  '欢迎回来，看极光的雪橇狗！',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
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

                // 其他内容保持不变...
                const SizedBox(height: 24),

                // 活动Banner：共赴山海
                GestureDetector(
                  onTap: () {
                    // 报名页面跳转逻辑
                  },
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/home_huodong_1.png',
                        ), // 本地Banner
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // 文字 + 按钮
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '共赴山海',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '组成10个家庭团，7天6夜自然零距离\n目的地：泸沽湖\n报名截止2025年6月1日',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  '前往报名',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 内容卡片区
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildCard(
                            imagePath: 'assets/images/home_duorou.png',
                            title: '多肉的小秘密',
                            desc: '多肉植物也有“冬眠”或“夏眠”哦！天气太热或太冷的时候，多肉会像小动物一样……',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCard(
                            imagePath: 'assets/images/home_xiuqiu.png',
                            title: '会变魔术的绣球',
                            desc: '绣球花的颜色很神奇，会因为土壤的不同而变色！如果土壤是酸性的，它的花会变成蓝色……',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildCard(
                      imagePath: 'assets/images/home_shuilian.png',
                      title: '睡莲的奇妙世界',
                      desc: '睡莲是水生植物中的精灵，随着昼夜变化开合，宛如水中的花仙子……',
                      isFullWidth: true,
                    ),
                    const SizedBox(height: 12),
                    _buildCard(
                      imagePath: 'assets/images/home_lvye.png',
                      title: '绿叶的光合作用',
                      desc: '绿叶通过光合作用为植物制造能量，是生命循环中不可或缺的一环……',
                      isFullWidth: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 卡片组件（修改互动图标位置）
  Widget _buildCard({
    required String imagePath,
    required String title,
    required String desc,
    bool isFullWidth = false,
  }) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图片区域（使用Stack将图标叠加在右上角）
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              // 右上角互动图标
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  // decoration: BoxDecoration(
                  //   color: Colors.white.withOpacity(0.8),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
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
              ),
            ],
          ),

          // 文字内容
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
