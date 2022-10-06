import 'package:chatter_flutter_chat_app/helpers.dart';
import 'package:chatter_flutter_chat_app/pages/calls_page.dart';
import 'package:chatter_flutter_chat_app/pages/contacts_page.dart';
import 'package:chatter_flutter_chat_app/pages/messages_page.dart';
import 'package:chatter_flutter_chat_app/pages/notifications_page.dart';
import 'package:chatter_flutter_chat_app/themes.dart';
import 'package:chatter_flutter_chat_app/widgets/glowing_action_button.dart';
import 'package:chatter_flutter_chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitles = [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: ((BuildContext context, value, _) {
            return Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: (brightness == Brightness.light)
                    ? AppColors.textDark
                    : null,
              ),
            );
          }),
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
              icon: CupertinoIcons.search,
              onTap: () {
                print('todo search');
              }),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPicturedUrl()),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 8,
            right: 8,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
                index: 0,
                lable: 'Messaging',
                icon: CupertinoIcons.chat_bubble_2_fill,
              ),
              _NavigationBarItem(
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
                index: 1,
                lable: 'Notification',
                icon: CupertinoIcons.bell_fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GlowingActionButton(
                  color: AppColors.secondry,
                  icon: CupertinoIcons.add,
                  onPressed: () {},
                ),
              ),
              _NavigationBarItem(
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
                index: 2,
                lable: 'Calls',
                icon: CupertinoIcons.phone_fill,
              ),
              _NavigationBarItem(
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
                index: 3,
                lable: 'Contacts',
                icon: CupertinoIcons.person_2_fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {required this.lable,
      required this.icon,
      required this.index,
      required this.onTap,
      this.isSelected = false});

  final ValueChanged<int> onTap;

  final String lable;
  final IconData icon;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondry : null,
            ),
            const SizedBox(height: 8),
            Text(
              lable,
              style: isSelected
                  ? const TextStyle(color: AppColors.secondry, fontSize: 11)
                  : const TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
