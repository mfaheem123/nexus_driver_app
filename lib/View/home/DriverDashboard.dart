import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/home/Setting/list.dart';
import 'package:driver_app_alpha/View/home/Statistics/statictics.dart';
import 'package:driver_app_alpha/View/home/jobDetailsScreen.dart';
import 'package:driver_app_alpha/View/home/my_earning.dart';
import 'package:driver_app_alpha/View/home/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDashboard extends StatefulWidget {
  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardHome(), // We'll move the dashboard UI into a separate widget
    JobDetailsScreen(),
    MyEarningsScreen(),
    // Center(child: Text('Your Trips')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: _pages[_currentIndex], // ✅ This is now correct
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color.fromARGB(255, 91, 19, 128),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          iconSize: 29,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'My Earnings',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// 👇 Moved your dashboard UI to a separate widget
class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isBreakActive = false;

  bool isPanicActive = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 91, 19, 128),
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Driver Dashboard',
                style: gilroySemiBold(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.power_settings_new,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: theme.cardColor,

            ///-----------------------------------------------
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back !',
                        style: gilroyBold(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                      Text(
                        'Jonathan Patterson',
                        style: gilroyMedium(
                          fontSize: 15,
                          color: theme.textTheme.bodyMedium!.color,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.badge_outlined),
                          Text(
                            '1',
                            style: gilroyMedium(
                              fontSize: 15,
                              color: theme.textTheme.bodyMedium!.color,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Icon(
                            Icons.assignment,
                            color: theme.textTheme.bodyMedium!.color,
                          ),
                          Text(
                            '100',
                            style: gilroyMedium(
                              fontSize: 15,
                              color: theme.textTheme.bodyMedium!.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.notificationsScreen);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            Icons.notifications,
                            color: theme.textTheme.bodyMedium!.color,
                            size: 24,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 25, color: Colors.green),
                  const SizedBox(width: 10),
                  Text(
                    '123 Anywhere Street, Any City',
                    style: gilroyMedium(
                      fontSize: 15,
                      color: theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: theme
                      .inputDecorationTheme
                      .fillColor, //--------------------------------------------------------
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.green, size: 25),
                    const SizedBox(width: 10),
                    Text(
                      '0hr , 24 mins . 56 sec',
                      style: gilroyMedium(
                        fontSize: 15,
                        color: theme.textTheme.bodyMedium!.color,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.grid_view,
                      color: Color.fromARGB(255, 91, 19, 128),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 25,
              children: [
                _buildDashboardButton(Icons.email, 'Messages', badge: true),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.BookingScreen),
                  child: _buildDashboardButton(Icons.task_alt, 'Booking'),
                ),
                // ✅ Break button toggle
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBreakActive = !isBreakActive;
                    });
                    Get.toNamed(Routes.BreakScreen);
                  },
                  child: _buildDashboardButton(
                    Icons.coffee,
                    'Break',
                    active: isBreakActive,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(SettingsScreen()),
                  child: _buildDashboardButton(Icons.settings, 'Settings'),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PlotScreen);
                  },
                  child: _buildDashboardButton(
                    Icons.north_east,
                    'Plots',
                    check: true,
                  ),
                ),
                // ✅ Panic button toggle
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPanicActive = !isPanicActive;
                    });
                  },
                  child: _buildDashboardButton(
                    Icons.warning,
                    'Panic',
                    active: isPanicActive,
                  ),
                ),
                // Statistics Button-----------
                GestureDetector(
                  // onTap: () => Get.to(StaticticsScreen()),
                  child: _buildDashboardButton(
                    Icons.multiple_stop_outlined,
                    'Multi Job',
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(StaticticsScreen()),
                  child: _buildDashboardButton(Icons.settings, 'Statistics'),
                ),

                GestureDetector(
                  onTap: () => Get.to(StaticticsScreen()),
                  child: _buildDashboardButton(
                    Icons.follow_the_signs_sharp,
                    'Flag Down',
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(StaticticsScreen()),
                  child: _buildDashboardButton(
                    Icons.drive_eta_rounded,
                    'Driver Pay',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardButton(
    IconData icon,
    String title, {
    bool badge = false,
    bool check = false,
    bool active = false,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: active
                ? Colors
                      .red // ✅ Agar active hai to red
                : const Color.fromARGB(
                    255,
                    91,
                    19,
                    128,
                  ), // warna default purple
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 40),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: gilroyMedium(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        if (badge)
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
              child: Text(
                '1',
                style: gilroyMedium(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        if (check)
          const Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.check,
                size: 12,
                color: Color.fromARGB(255, 91, 19, 128),
              ),
            ),
          ),
      ],
    );
  }
}
