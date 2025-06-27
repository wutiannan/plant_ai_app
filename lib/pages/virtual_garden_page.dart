import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/garden_page.dart'; // 导入花园页
import 'package:plant_ai_app/pages/nursery_room_page.dart'; // 导入培育房页

class VirtualGardenPage extends StatelessWidget {
  const VirtualGardenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xFFD9F8E7), Color(0xFFF9F7FE)],
          // ),
        ),
        // 页面背景图
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部栏：菜单  + 头像
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 菜单图标
                  Image.asset(
                    'assets/images/main_icon_menu.png',
                    width: 24,
                    height: 24,
                  ),
                  // 头像
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

              const SizedBox(height: 12),

              // 标题区域
              const Text(
                '来布置你的个性化“植域”吧！',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'LET’S SET UP YOUR EXCLUSIVE ’PLANTING AREA’!',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 28),

              // 花园横幅 + 进入花园按钮
              Stack(
                children: [
                  // 横幅图片
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/virtual_garden_banner.png',
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 进入花园按钮（右上角）
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () {
                        // 点击进入花园
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GardenPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '进入花园',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 横幅标题（左下角）
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: const Text(
                      '雪橇狗的花园',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 功能按钮区：竖排的植物图鉴和植域商城
              Row(
                children: [
                  // 右侧培育房按钮
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // 点击进入花园
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NurseryRoomPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 184, // 与左侧两个按钮高度一致
                        // decoration: BoxDecoration(
                        //   // color: Colors.white,
                        //   borderRadius: BorderRadius.circular(12),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.1),
                        //       blurRadius: 4,
                        //       offset: const Offset(0, 2),
                        //     ),
                        //   ],
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/virtual_nursery_room.png',
                              width: 164,
                              height: 164,
                            ),
                            // const SizedBox(height: 12),
                            // const Text(
                            //   '培育房',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 左侧竖排按钮
                  Column(
                    children: [
                      // 植物图鉴
                      GestureDetector(
                        onTap: () {
                          // 植物图鉴点击逻辑
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/virtual_plant_encyclopedia.png',
                              width: 165,
                              height: 84,
                            ),
                            // const SizedBox(height: 8),
                            // const Text(
                            //   '植物图鉴',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // 植域商城
                      GestureDetector(
                        onTap: () {
                          // 植域商城点击逻辑
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/virtual_garden_mall.png',
                              width: 165,
                              height: 84,
                            ),
                            // const SizedBox(height: 8),
                            // const Text(
                            //   '植域商城',
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                ],
              ),

              const SizedBox(height: 24),

              // 植物卡片区：栀子花 + 草莓
              Row(
                children: [
                  // 栀子花卡片（带渐变色）
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFF0F9F4), Color(0xFFE8F8F3)],
                        ),
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
                          // 植物图片
                          Center(
                            child: Image.asset(
                              'assets/images/virtual_gardenia.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 植物名称
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '栀子花',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // 植物描述
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '为茜草科、栀子属灌木植物，花芳香，单朵生于枝顶，花期3~7月，果期5月~翌年2月。',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 培养难度（椭圆形）
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Text(
                                  '培养难度：',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F8F3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                        size: 8,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '中等',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 价格与操作（域币数值和文字分开）
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '150',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      '域币',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // 购物车逻辑
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // 收藏逻辑
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 草莓卡片（带渐变色）
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFF0F9F4), Color(0xFFE8F8F3)],
                        ),
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
                          // 植物图片
                          Center(
                            child: Image.asset(
                              'assets/images/virtual_strawberry.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 植物名称
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '草莓',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // 植物描述
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '蔷薇科草莓属多年生草本植物，小叶具短柄，倒卵形或菱形，花期4~5月，果期6~7月。',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 培养难度（椭圆形）
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Text(
                                  '培养难度：',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F8F3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                        size: 8,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '较难',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 价格与操作（域币数值和文字分开）
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '250',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    const Text(
                                      '域币',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // 购物车逻辑
                                      },
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // 收藏逻辑
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
}
