import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/ar_task_select_page.dart';
import 'package:plant_ai_app/pages/nearby_explore_page.dart';
import 'package:flutter/material.dart';

class ARExplorePage extends StatelessWidget {
  const ARExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F8F3), Color(0xFFFFFFFF)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                          // progress: 0.6,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildVirtualCard(
                          imagePath: 'assets/images/explore_travel.png',
                          title: '穿越时空的植物朋友',
                          // progress: 0.3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildVirtualCard(
                    imagePath: 'assets/images/explore_lab.png',
                    title: '小小植物科学家实验室',
                    // progress: 0.8,
                    isFullWidth: true,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                '户外实地探索任务',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // 优化后的户外实地探索任务卡片（带底图）
              Row(
                children: [
                  Expanded(
                    child: _buildTaskCard(
                      imagePath: 'assets/images/explore_btn_bg.png',
                      title: '计划任务',
                      iconPath: 'assets/images/explore_todo.png',
                      // count: 8,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTaskCard(
                      imagePath: 'assets/images/explore_btn_bg.png',
                      title: '附近推荐任务',
                      iconPath: 'assets/images/explore_nearby.png',
                      // count: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTaskCard(
                      imagePath: 'assets/images/explore_btn_bg.png',
                      title: '受邀任务',
                      iconPath: 'assets/images/explore_invited.png',
                      // count: 3,
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
    // required double progress,
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
            height: 70, // 覆盖下半部分
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.withOpacity(0.0), // 顶部透明
                    Colors.blue.withOpacity(0.7), // 底部70%透明度
                  ],
                ),
              ),
            ),
          ),

          // // 右上角进度条
          // Positioned(
          //   top: 8,
          //   right: 8,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.8),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 40,
          //           height: 4,
          //           decoration: BoxDecoration(
          //             color: Colors.grey[300],
          //             borderRadius: BorderRadius.circular(2),
          //           ),
          //           child: FractionallySizedBox(
          //             widthFactor: progress,
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: Colors.green,
          //                 borderRadius: BorderRadius.circular(2),
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(width: 4),
          //         Text(
          //           '${(progress * 100).toInt()}%',
          //           style: const TextStyle(
          //             fontSize: 10,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // 底部文字内容（覆盖在半透明蓝色上）
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       'assets/images/home_icon_star.png',
                  //       width: 12,
                  //       height: 12,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     const Text(
                  //       '4.8',
                  //       style: TextStyle(fontSize: 10, color: Colors.white),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     Image.asset(
                  //       'assets/images/home_icon_star.png',
                  //       width: 12,
                  //       height: 12,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     const Text(
                  //       '12.5k',
                  //       style: TextStyle(fontSize: 10, color: Colors.white),
                  //     ),
                  //   ],
                  // ),
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
    required String imagePath,
    required String title,
    required String iconPath,
    // required int count,
  }) {
    return Container(
      height: 167,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     blurRadius: 4,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 图标
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.asset(iconPath, width: 16, height: 16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 标题
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 任务数量
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 8,
                  //     vertical: 2,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white.withOpacity(0.2),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Text(
                  //     '$count个任务',
                  //     style: const TextStyle(fontSize: 10, color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
