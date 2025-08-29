import 'package:driver_app/Component/textStyle.dart';
import 'package:driver_app/View/home/jobDetailsScreen.dart';
import 'package:driver_app/View/home/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:driver_app/Routes/app_pages.dart';

class DriverDashboard extends StatefulWidget {
  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardHome(), // We'll move the dashboard UI into a separate widget
    JobDetailsScreen(),
    JobDetailsScreen(),
    // Center(child: Text('Your Trips')),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_currentIndex], // ✅ This is now correct
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Color.fromARGB(255, 91, 19, 128),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          iconSize: 29,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Jobs'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Your Trips'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// 👇 Moved your dashboard UI to a separate widget
class DashboardHome extends StatefulWidget {
   DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isBreakActive = false;

  bool isPanicActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromARGB(255, 91, 19, 128),
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Driver Dashboard',
                  style: gilroySemiBold(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                  padding: const EdgeInsets.all(6),
                  child: Icon(Icons.power_settings_new, size: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Color(0xFFF0F0F0),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back !',
                          style: gilroyBold(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Jonathan Patterson', style: gilroyMedium(fontSize: 15)),
                      Row(
                        children: [
                        Icon(Icons.badge_outlined) , Text('1', style: gilroyMedium(fontSize: 15)),
                          SizedBox(width: 30,),
                          Icon(Icons.assignment) , Text('100', style: gilroyMedium(fontSize: 15)),
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
                          decoration:
                          BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.notifications, color: Colors.white, size: 24),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
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
                  Icon(Icons.location_on, size: 25, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    '123 Anywhere Street, Any City',
                    style: gilroyMedium(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer, color: Colors.green, size: 25),
                    SizedBox(width: 10),
                    Text(
                      '0hr , 24 mins . 56 sec',
                      style: gilroyMedium(fontSize: 15),
                    ),
                    Spacer(),
                    Icon(Icons.grid_view, color: Color.fromARGB(255, 91, 19, 128)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 30,
              children: [
                _buildDashboardButton(Icons.email, 'Messages', badge: true),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.rideInfoScreen),
                  child: _buildDashboardButton(Icons.task_alt, 'Jobs'),
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
                  onTap: () => Get.toNamed(Routes.jobInvitationScreen),
                  child: _buildDashboardButton(
                      Icons.filter_1, 'Multiple jobs'),
                ),
                GestureDetector(
                  onTap: () {
Get.toNamed(Routes.JobAlertScreen);
                  },
                  child: _buildDashboardButton(Icons.north_east, 'Plots', check: true),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

   Widget _buildDashboardButton(IconData icon, String title,
       {bool badge = false, bool check = false, bool active = false}) {
     return Stack(
       children: [
         Container(
           decoration: BoxDecoration(
             color: active
                 ? Colors.red // ✅ Agar active hai to red
                 : const Color.fromARGB(255, 91, 19, 128), // warna default purple
             borderRadius: BorderRadius.circular(12),
           ),
           child: Center(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(icon, color: Colors.white, size: 40),
                 const SizedBox(height: 10),
                 Text(title,
                     style: gilroyMedium(color: Colors.white, fontSize: 15)),
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
                 child: Text('1',
                     style: gilroyMedium(fontSize: 10, color: Colors.white))),
           ),
         if (check)
           const Positioned(
               top: 10,
               right: 10,
               child: CircleAvatar(
                   radius: 8,
                   backgroundColor: Colors.white,
                   child: Icon(Icons.check,
                       size: 12, color: Color.fromARGB(255, 91, 19, 128)))),
       ],
     );
   }
}
