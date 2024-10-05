import 'package:employee_login/Employeepage.dart';
import 'package:flutter/material.dart';
import 'package:employee_login/homepage.dart';
import 'package:employee_login/loginpage.dart';
import 'package:employee_login/profilepage.dart';

final reddishBrown = const Color(0xFF6D3F2E);

class HierarchicalPage extends StatefulWidget {
  const HierarchicalPage({super.key});

  @override
  _HierarchicalPageState createState() => _HierarchicalPageState();
}

class _HierarchicalPageState extends State<HierarchicalPage> {
  bool _isManagerExpanded = false;
  int _expandedTeamLeaderIndex = -1;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

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
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF8A1008),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('propic.png'),
                    radius: isMobile ? 20.0 : 30.0,
                  ),
                  SizedBox(width: isMobile ? 8.0 : 16.0),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 12 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, 'Home', HomePage()),
            _buildDrawerItem(Icons.person, 'Profile', ProfilePage()),
            _buildDrawerItem(Icons.logout, 'Logout', LoginScreen()),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 239, 245, 200),
              Color.fromARGB(255, 244, 189, 189),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Moukthika Enterprises Pvt. Ltd.',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8A1008),
                        ),
                      ),
                      Text(
                        'Hierarchical Structure Overview',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildRoleCard(
                  'Managing Director',
                  const Color.fromARGB(255, 119, 41, 8),
                  Icons.person,
                  isMobile,
                ),
                _buildConnectionLine(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isManagerExpanded = !_isManagerExpanded;
                    });
                  },
                  child: _buildRoleCard(
                    'Manager',
                    Colors.purple,
                    Icons.supervisor_account,
                    isMobile,
                  ),
                ),
                if (_isManagerExpanded)
                  Column(
                    children: [
                      _buildConnectionLine(),
                      _buildTeamLeadersSection(context, isMobile),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
      String title, Color iconColor, IconData icon, bool isMobile) {
    final displayTitle = isMobile ? _abbreviateRole(title) : title;

    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * 0.35 : 200,
      padding: EdgeInsets.all(isMobile ? 6 : 12),
      margin: EdgeInsets.symmetric(vertical: isMobile ? 4 : 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: iconColor, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isMobile ? 24 : 40, color: iconColor),
          SizedBox(height: isMobile ? 4 : 8),
          Text(
            displayTitle,
            style: TextStyle(
              color: iconColor,
              fontSize: isMobile ? 12 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _abbreviateRole(String role) {
    const abbreviations = {
      'Managing Director': 'Managing Director',
      'Manager': 'Manager',
      'Field Executives': 'FE',
      'Telecallers': 'TE',
      'Field Supervisors': 'FS',
    };

    return abbreviations[role] ?? role;
  }

  Widget _buildConnectionLine() {
    return Container(
      height: 30,
      width: 2,
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(vertical: 6),
    );
  }

  Widget _buildTeamLeadersSection(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildTeamColumn(
              context,
              'Team Leader 1',
              ['Field Executives', 'Telecallers', 'Field Supervisors'],
              1,
              isMobile,
            ),
          ),
          SizedBox(width: isMobile ? 8 : 16),
          Expanded(
            child: _buildTeamColumn(
              context,
              'Team Leader 2',
              ['Field Executives', 'Telecallers', 'Field Supervisors'],
              2,
              isMobile,
            ),
          ),
          SizedBox(width: isMobile ? 8 : 16),
          Expanded(
            child: _buildTeamColumn(
              context,
              'Team Leader 3',
              ['Field Executives', 'Telecallers', 'Field Supervisors'],
              3,
              isMobile,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamColumn(
    BuildContext context,
    String teamName,
    List<String> teams,
    int teamLeaderIndex,
    bool isMobile,
  ) {
    final displayTeamName = isMobile ? _abbreviateRole(teamName) : teamName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expandedTeamLeaderIndex =
                  _expandedTeamLeaderIndex == teamLeaderIndex
                      ? -1
                      : teamLeaderIndex;
            });
          },
          child: _buildRoleCard(
            displayTeamName,
            const Color.fromARGB(255, 77, 10, 231),
            Icons.group,
            isMobile,
          ),
        ),
        if (_expandedTeamLeaderIndex == teamLeaderIndex)
          Padding(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: teams.map((team) {
                final displayTeam = isMobile ? _abbreviateRole(team) : team;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showTeamDialog(context, displayTeamName, displayTeam, [
                        'Member 1',
                        'Member 2',
                        'Member 3',
                      ]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 4 : 8,
                      ),
                      child: _buildRoleCard(
                        displayTeam,
                        Colors.green,
                        Icons.group_work,
                        isMobile,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  void _showTeamDialog(BuildContext context, String teamLeaderName,
      String teamName, List<String> members) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 232, 241, 242),
                  Color.fromARGB(255, 245, 200, 200),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.all(isMobile ? 12 : 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  teamLeaderName,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  teamName,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 119, 41, 8),
                  ),
                ),
                const SizedBox(height: 16),
                ...members.map((member) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const EmployeeProfileAndProgressPage(),
                      ));
                    },
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.person,
                            color: Color.fromARGB(255, 119, 41, 8)),
                        title: Text(
                          member,
                          style: TextStyle(fontSize: isMobile ? 14 : 18),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                TextButton(
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Widget destinationPage) {
    return ListTile(
      leading: Icon(icon, color: reddishBrown),
      title: Text(
        title,
        style: TextStyle(
          color: reddishBrown,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/teamprofile');
      },
    );
  }
}
