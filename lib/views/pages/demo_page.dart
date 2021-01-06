import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'forget_password_page.dart';
import 'create_profile_page.dart';


class DemoPage extends StatelessWidget {
  static const id= "demo_page";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(

          child: Scaffold(
            backgroundColor: kGrayColorBG,
          //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            appBar: AppBar(

           backgroundColor: kGrayColorBG,
              elevation: 0,
              bottom:

              PreferredSize(
                child: TabBar(

                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: AppSizes.appVerticalLg *0.1, right: AppSizes.appVerticalLg *0.1),
                  tabs: [
                    Tab(
                      child: Icon(FontAwesomeIcons.solidCircle,size: AppSizes.appVerticalLg * 0.2,)
                    ),
                    Tab(
                  child: Icon(FontAwesomeIcons.circle,size: AppSizes.appVerticalLg * 0.2,)
                    ),
                    Tab(
                        child: Icon(FontAwesomeIcons.circle,size: AppSizes.appVerticalLg * 0.2,)
                    ),
                    Tab(
                        child: Icon(FontAwesomeIcons.circle,size: AppSizes.appVerticalLg * 0.2,)
                    ),

                  ],
                ),
              ),
            ),
            body: TabBarView(

              controller: _tabController,
              children: [
                CreateProfilePage(),
                ForgetPasswordPage(),
                Card(
                  color:kTextBlueColor ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text('Hello 3'),
                        subtitle: Text('The End'),
                      ),
                    ],
                  ),
                ),
                Card(
                  color:kTextBlueColor ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text('Hello 3'),
                        subtitle: Text('The End'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
