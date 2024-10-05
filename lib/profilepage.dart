import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  Future<Map<String, String>> _loadProfileData() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'Name': 'User Name',
      'Employee ID': 'ME123456',
      'Email': 'user@gmail.com',
      'Phone': '+1234567890',
      'Designation': 'Manager',
      'Department': 'AXIS',
      'Reporting Officer': 'Officer',
      'Date of Joining': '2024-01-01',
      'Father\'s Name': 'Father',
      'Branch Name': 'Hyderabad',
      'Work Location': 'Hyderabad',
      'Employee Portfolio': 'AXIS BKIT',
      'Bank ID Card': 'BANK123456789',
      'Blood Group': 'O+',
    };
  }

  final Map<String, IconData> detailIcons = {
    'Name': Icons.person,
    'Employee ID': Icons.badge,
    'Email': Icons.email,
    'Phone': Icons.phone,
    'Designation': Icons.work,
    'Department': Icons.group,
    'Reporting Officer': Icons.supervisor_account,
    'Date of Joining': Icons.calendar_today,
    'Father\'s Name': Icons.family_restroom,
    'Branch Name': Icons.location_city,
    'Work Location': Icons.location_on,
    'Employee Portfolio': Icons.folder,
    'Bank ID Card': Icons.credit_card,
    'Blood Group': Icons.health_and_safety,
  };

  final Color reddishBrown = const Color(0xFF8A1008);

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF732F14), Color(0xFFFAD02E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Profile',
            style: TextStyle(
              color: reddishBrown,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8A1008),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('propic.png'),
                    radius: 30.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFACD), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Map<String, String>>(
          future: _loadProfileData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8A1008)),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading profile data'));
            } else {
              final profileData = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double headerWidth = constraints.maxWidth > 800
                        ? constraints.maxWidth * 0.6
                        : constraints.maxWidth * 0.9;
                    double logoWidth = constraints.maxWidth > 800
                        ? constraints.maxWidth * 0.1
                        : 40.0;
                    double spacing = constraints.maxWidth * 0.05;
                    double fontSize = isMobile ? 14.0 : 16.0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: isMobile ? 2 : 1,
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: reddishBrown, width: 2.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: isMobile ? 80.0 : 100.0,
                                      height: isMobile ? 80.0 : 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        image: const DecorationImage(
                                          image: AssetImage('propic.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profileData['Name']!,
                                            style: TextStyle(
                                              fontSize: isMobile ? 18.0 : 22.0,
                                              fontWeight: FontWeight.bold,
                                              color: reddishBrown,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/hierarchical');
                                            },
                                            child: Text(
                                              profileData['Designation']!,
                                              style: TextStyle(
                                                fontSize:
                                                    isMobile ? 14.0 : 16.0,
                                                color: Colors.grey[600],
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit_document,
                                          color: reddishBrown),
                                      onPressed: () {
                                        _showEditDialog(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!isMobile) SizedBox(width: spacing),
                            if (!isMobile)
                              SizedBox(
                                width: logoWidth,
                                child: Image.asset(
                                  'logo.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              bool isDesktop = constraints.maxWidth > 800;
                              return isDesktop
                                  ? GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 4,
                                      ),
                                      itemCount: profileData.length,
                                      itemBuilder: (context, index) {
                                        String key =
                                            profileData.keys.elementAt(index);
                                        String value =
                                            profileData.values.elementAt(index);
                                        IconData icon =
                                            detailIcons[key] ?? Icons.info;
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(icon, color: reddishBrown),
                                              const SizedBox(width: 12.0),
                                              Text(
                                                '$key: ',
                                                style: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: fontSize,
                                                    color: Colors.grey[600],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount: profileData.length,
                                      itemBuilder: (context, index) {
                                        String key =
                                            profileData.keys.elementAt(index);
                                        String value =
                                            profileData.values.elementAt(index);
                                        IconData icon =
                                            detailIcons[key] ?? Icons.info;
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 16.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(icon, color: reddishBrown),
                                              const SizedBox(width: 12.0),
                                              Text(
                                                '$key: ',
                                                style: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: fontSize,
                                                    color: Colors.grey[600],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) async {
    File? newProfileImage;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        final isMobile = MediaQuery.of(context).size.width < 600;
        final avatarRadius = isMobile ? 50.0 : 60.0; // Adjusted radius

        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Edit profile picture:'),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);

                    if (result != null) {
                      newProfileImage = File(result.files.single.path!);
                    }
                  },
                  child: CircleAvatar(
                    radius: avatarRadius, // Use the dynamic radius
                    backgroundColor: Colors.grey[300],
                    backgroundImage: newProfileImage != null
                        ? FileImage(newProfileImage!)
                        : const AssetImage(
                            'propic.png',
                          ) as ImageProvider,
                    child: const Align(
                      alignment: Alignment.center,
                      child:
                          Icon(Icons.camera_alt_rounded, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  initialValue: 'user@gmail.com',
                  decoration: const InputDecoration(
                    labelText: 'Email ID',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  initialValue: '+1234567890',
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                // Save the edited data
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
