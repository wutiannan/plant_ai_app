import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class CultivationInteractionPage extends StatefulWidget {
  final Plant plant;

  const CultivationInteractionPage({super.key, required this.plant});

  @override
  State<CultivationInteractionPage> createState() =>
      _CultivationInteractionPageState();
}

class _CultivationInteractionPageState
    extends State<CultivationInteractionPage> {
  // 进度条数据（模拟）
  final double _humidityProgress = 0.6; // 对应 60%RH
  double _temperatureProgress = 0.333; // 相对进度 (20-10)/(40-10) ≈ 0.333
  double _lightProgress = 0.6; // 相对进度 (16000-10000)/(20000-10000) = 0.6

  // 将相对进度转换为实际值
  double _getTemperatureValue() => 10 + _temperatureProgress * 30;
  double _getLightValue() => 10000 + _lightProgress * 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 整体背景图
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部导航栏
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 返回按钮
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/main_icon_back.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    // 标题
                    Text(
                      '培养互动',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // 更多按钮
                    Image.asset(
                      'assets/images/main_icon_menu.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 左侧操作按钮（阳光、雨水）
                    Positioned(
                      left: 20,
                      child: Column(
                        children: [
                          _buildActionButton(
                            iconPath: 'assets/images/sun_icon.png',
                          ),
                          const SizedBox(height: 16),
                          _buildActionButton(
                            iconPath: 'assets/images/rain_icon.png',
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // 植物图片
                        Image.asset(
                          widget.plant.image,
                          width: 180,
                          height: 220,
                          fit: BoxFit.contain,
                        ),

                        // 浇水图标（固定在植物右上方）
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Image.asset(
                            'assets/images/watering_can_icon.png',
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ],
                    ),

                    // 右侧操作按钮（除虫、施肥、清洁）
                    Positioned(
                      right: 20,
                      child: Column(
                        children: [
                          _buildActionButton(
                            iconPath: 'assets/images/spray_icon.png',
                          ),
                          const SizedBox(height: 16),
                          _buildActionButton(
                            iconPath: 'assets/images/fertilizer_icon.png',
                          ),
                          const SizedBox(height: 16),
                          _buildActionButton(
                            iconPath: 'assets/images/clean_icon.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 培育进度条
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: widget.plant.progress,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '培育进度',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 植物名称切换栏
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/chevron_left_icon.png',
                          width: 16,
                          height: 16,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        widget.plant.name,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/chevron_right_icon.png',
                          width: 16,
                          height: 16,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 加速培育条件提示
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF46D7E7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/warning_icon.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '目前您的这株植物所需阳光还差5份噢！',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 控制卡片区域（带背景图）
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: [
                    _buildControlCard(
                      iconPath: 'assets/images/humidity_icon.png',
                      title: '湿度控制',
                      value: '${_humidityProgress * 100}%RH',
                      progress: _humidityProgress * 100,
                      min: 0,
                      max: 100,
                      backgroundImage: 'assets/images/cultivation_card_bg.png',
                    ),
                    _buildControlCard(
                      iconPath: 'assets/images/pest_icon.png',
                      title: '虫害检查',
                      value: '健康无害虫',
                      backgroundImage: 'assets/images/cultivation_card_bg.png',
                      isPestCheck: true,
                    ),
                    _buildControlCard(
                      iconPath: 'assets/images/temp_icon.png',
                      title: '温度控制',
                      value: '${_getTemperatureValue().toInt()}°C',
                      progress: _getTemperatureValue(), // 使用实际温度值
                      min: 10.0,
                      max: 40.0,
                      backgroundImage: 'assets/images/cultivation_card_bg.png',
                      onChanged: (value) {
                        setState(() {
                          // 将实际温度值转换回相对进度
                          _temperatureProgress = (value - 10) / 30;
                        });
                      },
                    ),
                    _buildControlCard(
                      iconPath: 'assets/images/light_icon.png',
                      title: '光照控制',
                      value: '${_getLightValue().toInt()}LUX',
                      progress: _getLightValue(), // 使用实际光照值
                      min: 10000.0,
                      max: 20000.0,
                      backgroundImage: 'assets/images/cultivation_card_bg.png',
                      onChanged: (value) {
                        setState(() {
                          // 将实际光照值转换回相对进度
                          _lightProgress = (value - 10000) / 10000;
                        });
                      },
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

  // 构建操作按钮（绿色圆底、白色图案）
  Widget _buildActionButton({required String iconPath}) {
    return SizedBox(
      width: 40,
      height: 40,
      // decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 40,
          height: 40, // color: Colors.white,
        ),
      ),
    );
  }

  // 构建控制卡片（带背景图）
  Widget _buildControlCard({
    required String iconPath,
    required String title,
    required String value,
    double? progress,
    double? min,
    double? max,
    required String backgroundImage,
    bool isPestCheck = false,
    Function(double)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图标（绿色圆底、白色图案）
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconPath,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // 标题
          Text(title, style: TextStyle(fontSize: 14, color: Colors.black)),

          // 值
          Text(value, style: TextStyle(fontSize: 12, color: Colors.grey[800])),
          const SizedBox(height: 4),
          // 进度条（仅非虫害检查卡片显示）
          if (!isPestCheck &&
              progress != null &&
              min != null &&
              max != null) ...[
            const SizedBox(height: 8),
            Slider(
              value: progress,
              min: min,
              max: max,
              onChanged: onChanged,
              activeColor: Colors.white,
              inactiveColor: Colors.grey[300],
            ),
            // 最小最大值显示
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title == '湿度控制'
                      ? '0%'
                      : title == '温度控制'
                      ? '10°C'
                      : '10000LUX',
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
                Text(
                  title == '湿度控制'
                      ? '100%'
                      : title == '温度控制'
                      ? '40°C'
                      : '20000LUX',
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
