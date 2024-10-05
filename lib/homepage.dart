import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true; // State to track loading status

  @override
  void initState() {
    super.initState();
    _loadData(); // Simulate data loading
  }

  Future<void> _loadData() async {
    await Future.delayed(
        const Duration(seconds: 1)); // Simulate a network delay
    setState(() {
      _isLoading = false; // Set loading state to false after loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF732F14), Color(0xFFFAD02E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Open the drawer when the menu button is pressed
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // Profile section
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 138, 16, 8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'propic.png'), // Replace with actual profile image asset
                    radius: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'User Name', // Replace with actual user name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // List of menu items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile tap
                Navigator.pushNamed(context, '/profile');
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 138, 16, 8)),
              ),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                int columns = width > 600 ? 2 : 1;
                double childAspectRatio =
                    width > 600 ? 3 : 2; // Adjust aspect ratio for mobile

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemCount: _cards.length,
                  itemBuilder: (context, index) {
                    return _buildCard(
                      _cards[index]['title'],
                      _cards[index]['content'],
                      _cards[index]['icon'],
                    );
                  },
                );
              },
            ),
    );
  }

  List<Map<String, dynamic>> get _cards => [
        {
          'title': 'Appointments',
          'content': 'List of appointments of the user previously.',
          'icon': Icons.person,
        },
        {
          'title': 'Monthly Allocation',
          'content': 'List of monthly active and inactive leads.',
          'icon': Icons.calendar_month,
        },
        {
          'title': 'Pickup Allocations',
          'content': 'List of pickup allocation.',
          'icon': Icons.run_circle,
        },
        {
          'title': 'Account Status',
          'content': 'Detailed description about the account.',
          'icon': Icons.document_scanner_sharp,
        },
        {
          'title': 'Collector Dashboard',
          'content': 'Current status and performance of the collector.',
          'icon': Icons.bar_chart,
        },
      ];

  Widget _buildCard(String title, String content, IconData icon) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: const Color.fromARGB(
                      255, 99, 31, 6), // Change icon color to brown
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 99, 31, 6), // Change text color to brown
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(
                    255, 99, 31, 6), // Change text color to brown
              ),
            ),
          ],
        ),
      ),
    );
  }
}
