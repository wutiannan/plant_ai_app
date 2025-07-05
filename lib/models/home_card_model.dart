class CardDataModel {
  final String imagePath;
  final String title;
  final String desc;
  final int crossAxisCellCount; // 控制卡片宽度（占几列）

  CardDataModel({
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.crossAxisCellCount,
  });
}

final List<CardDataModel> cardList = [
  CardDataModel(
    imagePath: 'assets/images/home_duorou.png',
    title: '多肉的小秘密',
    desc: '多肉植物也有“冬眠”或“夏眠”哦！天气太热或太冷的时候，多肉会像小动物一样……',
    crossAxisCellCount: 1, // 占 1 列
  ),
  CardDataModel(
    imagePath: 'assets/images/home_xiuqiu.png',
    title: '会变魔术的绣球',
    desc: '绣球花的颜色很神奇，会因为土壤的不同而变色！如果土壤是酸性的，它的花会变成蓝色……',
    crossAxisCellCount: 1,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_shuilian.png',
    title: '睡莲物语',
    desc: '睡莲是白天开花、晚上“睡觉”，长在水里的美丽植物，像漂在水面的小伞！',
    crossAxisCellCount: 1, 
  ),
  CardDataModel(
    imagePath: 'assets/images/home_mulan.png',
    title: '木兰香',
    desc: '木兰是开着大花朵的树，花香好闻，花瓣像小勺子一样展开。木兰树一般可以长到好几米高，树形高大又优雅~',
    crossAxisCellCount: 1,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_yumeiren.png',
    title: '虞美人开满的山坡',
    desc:
        '虞美人是茎上长着小绒毛的“跳舞花”，薄如彩纸的花瓣有红、粉等颜色，风一吹就像小裙子轻轻摇晃；它的花苞像小灯笼，开花时会自己“脱”掉外面的壳，特别有趣，快出门找找看它的身影！',
    crossAxisCellCount: 2,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_tanhua.png',
    title: '昙花一现',
    desc: '昙花是夜晚才悄悄绽放的“月下美人”，大花瓣雪白雪白的，开花时像展开的小烟花，不过只开几小时就“睡觉”啦~',
    crossAxisCellCount: 1,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_shaoyao.png',
    title: '芍药真的是药！',
    desc: '芍药是春天开着层层叠叠大花瓣的“花仙子”，根像红薯一样能做药材，花瓣摸起来像棉花糖哦！',
    crossAxisCellCount: 1,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_baihe.png',
    title: '百合花能吃？',
    desc: '百合的花瓣卷卷的像小喇叭，中间伸出毛茸茸的花蕊，香香的花朵里还藏着能吃的“小月亮”（鳞茎）！',
    crossAxisCellCount: 1,
  ),
  CardDataModel(
    imagePath: 'assets/images/home_xiangrikui.png',
    title: '向日葵永远不低头！',
    desc: '向日葵是跟着太阳转的“小太阳”，金黄的花瓣像围脖，花盘里挤满了香香的瓜子，每天抬头对太阳笑~',
    crossAxisCellCount: 1,
  ),
];
