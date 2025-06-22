// lib/pages/ar_task_select_page.dart
import 'package:flutter/material.dart';

class ARTaskSelectPage extends StatelessWidget {
  const ARTaskSelectPage({Key? key, required String taskType})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('快来选择你的探索任务吧！')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('今日运动量为360kcal', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            const Text('虚拟主题探索乐园'),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TaskCard(icon: Icons.map, title: '侏罗纪植物大冒险'),
                _TaskCard(icon: Icons.eco, title: '穿越时空的植物朋友'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('户外实地探索任务'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 计划任务逻辑
                    Navigator.pushNamed(context, '/planned-tasks');
                  },
                  child: const Text('计划任务'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 附近探索任务逻辑
                    Navigator.pushNamed(context, '/nearby-tasks');
                  },
                  child: const Text('附近探索任务'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 受邀任务逻辑
                    Navigator.pushNamed(context, '/invited-tasks');
                  },
                  child: const Text('受邀任务'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _TaskCard({Key? key, required this.icon, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 任务点击逻辑
        Navigator.pushNamed(context, '/ar-scan', arguments: {'name': title});
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 48, color: Colors.green),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
