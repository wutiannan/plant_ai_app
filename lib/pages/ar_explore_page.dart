import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/outdoor_explore_page.dart';

class ARExplorePage extends StatelessWidget {
  const ARExplorePage({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top - 20),
              // 顶部栏
              Row(
                children: [
                  Image.asset(
                    'assets/images/main_icon_menu.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: '搜索感兴趣的探索任务',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
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

              const SizedBox(height: 24),

              // 标题区域
              const Text(
                '快来选择你的探索任务吧！',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              const Text(
                '今日运动量为360kcal',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // 虚拟主题探索乐园
              const Text(
                '虚拟主题探索乐园',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),

              // 优化后的虚拟主题探索乐园卡片（带半透明蓝色覆盖）
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildVirtualCard(
                          imagePath: 'assets/images/explore_jurassic.png',
                          title: '侏罗纪植物大冒险',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildVirtualCard(
                          imagePath: 'assets/images/explore_travel.png',
                          title: '穿越时空的植物朋友',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildVirtualCard(
                    imagePath: 'assets/images/explore_lab.png',
                    title: '小小植物科学家实验室',
                    isFullWidth: true,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                '户外实地探索任务',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),

              // 优化后的户外实地探索任务卡片（带底图）
              Row(
                children: [
                  Expanded(
                    child: _buildTaskCard(
                      context: context,
                      imagePath: 'assets/images/explore_todo_bg.png',
                      title: '计划任务',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTaskCard(
                      context: context,
                      imagePath: 'assets/images/explore_nearby_bg.png',
                      title: '附近推荐任务',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTaskCard(
                      context: context,
                      imagePath: 'assets/images/explore_invited_bg.png',
                      title: '受邀任务',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建虚拟主题探索乐园卡片（带半透明蓝色覆盖）
  Widget _buildVirtualCard({
    required String imagePath,
    required String title,
    bool isFullWidth = false,
  }) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      height: isFullWidth ? 160 : 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          // 半透明蓝色覆盖（下半部分）
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 38,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF46D7E7).withOpacity(0.85),
                    const Color(0xFF46D7E7).withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),

          // 底部文字内容（覆盖在半透明蓝色上）
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建户外实地探索任务卡片（带底图）
  Widget _buildTaskCard({
    required BuildContext context,
    required String imagePath,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        if (title == '附近推荐任务') {
          // 导航到户外探索页面
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OutdoorExplorePage()),
          );
        } else {
          print('点击了$title');
          // 其他卡片的逻辑可以在这里添加
        }
      },
      child: Container(
        height: 167,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            // 底图
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),

            // 内容
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    // 标题
                    Text(
                      title,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
