import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: const Center(
              child: Text(
                'Job Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Profile Card
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/profile.jpg',
                  ), // Use appropriate image
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, John",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Congratulation, You have done your job."),
                      Text("Here you have your job details"),
                    ],
                  ),
                ),
                Icon(Icons.notifications, color: Colors.green),
              ],
            ),
          ),

          // Filter Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    items: [],
                    onChanged: (_) {},
                    hint: const Text('Date'),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DropdownButtonFormField(
                    items: [],
                    onChanged: (_) {},
                    hint: const Text('Drop off'),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DropdownButtonFormField(
                    items: [],
                    onChanged: (_) {},
                    hint: const Text('Pick up'),
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),

          // Job List
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, index) => const Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.green),
                          SizedBox(width: 5),
                          Text('123 Anywhere Street, Any City'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          SizedBox(width: 5),
                          Text('123 Anywhere Street, Any City'),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2-3 2025'),
                          Row(
                            children: [
                              Text(
                                'Completed',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Fare : 29€',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
