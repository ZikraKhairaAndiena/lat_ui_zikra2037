import 'package:flutter/material.dart';
import 'package:lat_ui_zikra2037/screen_page/page_home.dart';
import 'package:lat_ui_zikra2037/screen_page/page_mycourse.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Color? containerColor;
  // late SessionManager sessionManager;

  @override
  void initState() {
    super.initState();
    // sessionManager = SessionManager();
    // sessionManager.getSession();
    tabController = TabController(length: 4, vsync: this);
    containerColor = Colors.transparent;
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      containerColor = Colors.purple;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Colors.purple;
          });
        },
        child: TabBarView(
          controller: tabController,
          children: [
            PageHome(),
            PageMyCourses(),
            Container(), // Placeholder untuk tab ketiga (Blogs)
            Container(), // Placeholder untuk tab keempat (Profile)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBar(
            controller: tabController,
            labelColor: Colors.purple,
            tabs: const [
              Tab(
                text: "Home",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "My Course",
                icon: Icon(Icons.play_circle),
              ),
              Tab(
                text: "Blogs",
                icon: Icon(Icons.book),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.people),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
