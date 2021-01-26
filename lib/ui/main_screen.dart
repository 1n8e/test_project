import 'package:flutter/material.dart';
import 'package:test_project/consts/colors.dart';
import 'package:test_project/ui/widgets/album_screen/album_list_view.dart';
import 'package:test_project/ui/widgets/check_screen/check_list_view.dart';
import 'package:test_project/ui/widgets/contacts_screen/contacts_screen_view.dart';
import 'package:test_project/ui/widgets/custom_appbar.dart';
import 'package:test_project/ui/widgets/post_screen/post_list_view.dart';

class MainScreen extends StatefulWidget {
  final double barHeight = 56;
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<Widget> bodyWigets = [
  PostListView(),
  AlbumListView(),
  CheckList(),
  ContactsScreenView(),
];

final List<String> bodyTitles = [
  'News',
  'Gallery',
  'Check',
  'Contacts',
];

int currentIndex = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstColor.customBackgroundColor,
        appBar: PreferredSize(
          preferredSize:
              Size(double.maxFinite, statusBarHeight + widget.barHeight),
          child: CustomAppBar(
            screenTitle: bodyTitles[currentIndex],
            isHided: true,
          ),
        ),
        body: bodyWigets.elementAt(currentIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: CustomLinearGradient.customLinearGradient),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo), label: 'Gallery'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment), label: 'Check'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), label: 'Contacts'),
            ],
          ),
        ),
      ),
    );
  }
}
