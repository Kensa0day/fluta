import 'package:flutter/material.dart';
import 'akun.dart'; // Import halaman akun

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Fungsi untuk memilih halaman berdasarkan indeks yang dipilih
  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return const HomeContent(); // Halaman Home
      case 1:
        return const AkunPage(); // Halaman Akun
      case 2:
        return const LogoutContent(); // Halaman Logout
      default:
        return const HomeContent();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / 3;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle, color: Colors.black, size: 30),
            Text(
              "Guest",
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Notification button action
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Settings button action
            },
          ),
        ],
      ),
      
      body: _getSelectedPage(), // Menampilkan halaman yang sesuai dengan indeks yang dipilih

      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            backgroundColor: const Color(0xFFECE6F0),
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.stars),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Akun",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: "Logout",
              ),
            ],
          ),
          // Efek convex
          Positioned(
            bottom: 25,
            left: _selectedIndex * itemWidth + (itemWidth / 2) - 25,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 50,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.stars,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Home dengan Grid View dan List View
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid View Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Widget Grid View",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward), // Arrow icon for more
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECE6F0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/song_1.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Artist",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Song",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 16),
            
            // List View Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Widget List View",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward), // Arrow icon for more
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/song_1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Headline",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Description duis aute irure dolor in reprehenderit in volupt...",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 18),
                              Row(
                                children: [
                                  Icon(Icons.add_circle_outline, size: 16),
                                  SizedBox(width: 4),
                                  Text("Today • 23 min"),
                                  SizedBox(width: 70),
                                  Icon(Icons.play_arrow)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Logout
class LogoutContent extends StatelessWidget {
  const LogoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ini adalah halaman Logout',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
