import 'package:flutter/material.dart';
import 'package:plant_ai_app/pages/plant_model.dart';
import 'package:plant_ai_app/models/garden_model.dart';
import 'package:plant_ai_app/models/peripheral_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: const Text('植域商店'),
      //   bottom:      // TabBar(
      //   controller: _tabController,
      //   tabs: const [
      //     Tab(text: '植物'),
      //     Tab(text: '花园'),
      //     Tab(text: '周边'),
      //   ],
      // ),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/main_icon_back.png',
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          '培育房',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/main_icon_menu.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: const Color(0xFF999999),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: Colors.green),
            // insets: EdgeInsets.symmetric(horizontal: 16), // 左右间距
          ),
          tabs: const [
            Tab(text: '植物'),
            Tab(text: '花园'),
            Tab(text: '周边'),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [_buildPlantTab(), _buildGardenTab(), _buildPeripheralTab()],
      ),
    );
  }

  Widget _buildPlantTab() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: plants.length,
      itemBuilder: (context, index) {
        final plant = plants[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xFFFFF7BB), Color(0xFFC8FFFE)],
            ),
          ),
          child: Column(
            children: [
              // 植物图片
              Center(
                child: Image.asset(plant.image, height: 100, fit: BoxFit.cover),
              ),
              // Image.asset(plant.image, height: 120, fit: BoxFit.cover),
              // const SizedBox(height: 8),
              // 植物名称
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  plant.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // 植物描述
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  plant.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ),
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
                        const Text(
                          '域币',
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // 购物车逻辑
                            setState(() {
                              plants[index] = Plant(
                                name: plant.name,
                                enName: plant.enName,
                                image: plant.image,
                                description: plant.description,
                                category: plant.category,
                                price: plant.price,
                                isCollected: plant.isCollected,
                                isInCart: !plant.isInCart,
                                progress: 0,
                                cultivationDifficulty:
                                    plant.cultivationDifficulty,
                              );
                            });
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 18,
                            color: plant.isInCart
                                ? Colors.grey
                                : const Color(0xFF46D7E7),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // 收藏逻辑
                            setState(() {
                              plants[index] = Plant(
                                name: plant.name,
                                enName: plant.enName,
                                image: plant.image,
                                description: plant.description,
                                category: plant.category,
                                price: plant.price,
                                isCollected: !plant.isCollected,
                                isInCart: plant.isInCart,
                                progress: 0,
                                cultivationDifficulty:
                                    plant.cultivationDifficulty,
                              );
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 18,
                            color: plant.isCollected
                                ? Colors.grey
                                : const Color(0xFF46D7E7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGardenTab() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: gardenData.length,
      itemBuilder: (context, index) {
        final garden = gardenData[index];
        return Card(
          child: Column(
            children: [
              Image.asset(garden.image, height: 120, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  garden.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '价格：${garden.price} 硬币',
                style: const TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      garden.isCollected
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: garden.isCollected ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        gardenData[index] = GardenModel(
                          name: garden.name,
                          image: garden.image,
                          description: garden.description,
                          price: garden.price,
                          isCollected: !garden.isCollected,
                          isInCart: garden.isInCart,
                        );
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      garden.isInCart ? Icons.bookmark : Icons.bookmark_border,
                    ),
                    onPressed: () {
                      setState(() {
                        gardenData[index] = GardenModel(
                          name: garden.name,
                          image: garden.image,
                          description: garden.description,
                          price: garden.price,
                          isCollected: garden.isCollected,
                          isInCart: !garden.isInCart,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPeripheralTab() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: peripheralData.length,
      itemBuilder: (context, index) {
        final peripheral = peripheralData[index];
        return Card(
          child: Column(
            children: [
              Image.asset(peripheral.image, height: 120, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  peripheral.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '价格：${peripheral.price} 域币',
                style: const TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      peripheral.isCollected
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: peripheral.isCollected ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        peripheralData[index] = PeripheralModel(
                          name: peripheral.name,
                          image: peripheral.image,
                          description: peripheral.description,
                          price: peripheral.price,
                          isCollected: !peripheral.isCollected,
                          isInCart: peripheral.isInCart,
                        );
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      peripheral.isInCart
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),
                    onPressed: () {
                      setState(() {
                        peripheralData[index] = PeripheralModel(
                          name: peripheral.name,
                          image: peripheral.image,
                          description: peripheral.description,
                          price: peripheral.price,
                          isCollected: peripheral.isCollected,
                          isInCart: !peripheral.isInCart,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
