import 'package:fitness/chat.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/profile.dart';
import 'package:fitness/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [Chat(), Profile(), Settings()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  void initState() {
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color.fromARGB(255, 225, 221, 212),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          SizedBox(
            height: 40,
          ),
          _categoriesSection()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? Color.fromARGB(255, 10, 75, 49)
                              : Colors.grey,
                        ),
                        Text('Home',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? const Color.fromARGB(255, 10, 75, 49)
                                    : Colors.grey))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1
                              ? Color.fromARGB(255, 10, 75, 49)
                              : Colors.grey,
                        ),
                        Text('Chat',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? const Color.fromARGB(255, 10, 75, 49)
                                    : Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 3
                              ? Color.fromARGB(255, 10, 75, 49)
                              : Colors.grey,
                        ),
                        Text('Profile',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? const Color.fromARGB(255, 10, 75, 49)
                                    : Colors.grey))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 2
                              ? Color.fromARGB(255, 10, 75, 49)
                              : Colors.grey,
                        ),
                        Text('Settings',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? const Color.fromARGB(255, 10, 75, 49)
                                    : Colors.grey))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(left: 15)),
        Text(
          'Category',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          color: Color.fromARGB(255, 225, 221, 212),
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            //itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                //height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.rectangle),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14),
                      )
                    ]),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff101617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            hintText: 'Search',
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Container(
                color: Color.fromARGB(255, 243, 247, 245),
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Color(0xffDDDADA),
                      thickness: 0.1,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    )
                  ],
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'CropieeCrop',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
      backgroundColor: Color.fromARGB(255, 10, 75, 49),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/threedashline.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 17, 85, 20),
                borderRadius: BorderRadius.circular(10)),
          )),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 17, 85, 20),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
