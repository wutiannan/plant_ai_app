import 'package:flutter/material.dart';
import 'package:plant_ai_app/models/plant_model.dart';
import 'package:plant_ai_app/models/garden_model.dart';
import 'package:plant_ai_app/models/peripheral_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

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
          '植域商城',
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
              // 植物名称
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(plant.name, style: const TextStyle(fontSize: 16)),
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
                        Text('150', style: TextStyle(fontSize: 16)),
                        const Text('域币', style: TextStyle(fontSize: 12)),
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
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // gradient: const LinearGradient(
            //   begin: Alignment.bottomLeft,
            //   end: Alignment.topRight,
            //   colors: [Color(0xFFFFF7BB), Color(0xFFC8FFFE)],
            // ),
            image: DecorationImage(
              image: AssetImage(garden.image),
              fit: BoxFit.cover,
              // opacity: 0.1, // 调整底图透明度
            ),
          ),
          child: Column(
            children: [
              // 植物图片
              // Center(
              //   child: Image.asset(
              //     garden.image,
              //     height: 100,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              const SizedBox(height: 100),
              // 植物名称
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  garden.name,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              // 植物描述
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  garden.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
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
                          garden.price,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const Text(
                          '域币',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // 购物车逻辑
                            setState(() {
                              gardenData[index] = GardenModel(
                                name: garden.name,
                                image: garden.image,
                                description: garden.description,
                                price: garden.price,
                                isWishlist: garden.isWishlist,
                                isInCart: !garden.isInCart,
                              );
                            });
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 18,
                            color: garden.isInCart
                                ? Colors.white
                                : const Color(0xFF46D7E7),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // 收藏逻辑
                            setState(() {
                              gardenData[index] = GardenModel(
                                name: garden.name,
                                image: garden.image,
                                description: garden.description,
                                price: garden.price,
                                isWishlist: !garden.isWishlist,
                                isInCart: garden.isInCart,
                              );
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 18,
                            color: garden.isCollected
                                ? Colors.white
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
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(peripheral.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 100),
              // 周边名称
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  peripheral.name,
                  style: const TextStyle(fontSize: 16),
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
                          peripheral.price,
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text('域币', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // 购物车逻辑
                            setState(() {
                              peripheralData[index] = PeripheralModel(
                                name: peripheral.name,
                                image: peripheral.image,
                                price: peripheral.price,
                                isWishlist: !peripheral.isWishlist,
                              );
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 18,
                            color: peripheral.isWishlist
                                ? Colors.white
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
}
