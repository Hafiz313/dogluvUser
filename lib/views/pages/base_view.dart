import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseView extends StatefulWidget {
  static const id="base_view";
  final int index;
  const BaseView({Key key, this.index}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BaseView();
  }
}

class _BaseView extends State<BaseView> {
  bool _isNetworkConnected = true;
  Connectivity _connectivity;
  StreamSubscription _subscription;

  String _title;
  var userData;
  int _currentindex;
  @override
  void initState() {
    _connectivity = Connectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          if (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) {
            setState(() {
              //Conncted to mobile or wifi
              print("----------------------Internet Connected-----------------");
              _isNetworkConnected = true;
            });
          } else {
            setState(() {
              print(
                  "----------------------Internet Not Connected-----------------");
              _isNetworkConnected = false;
            });
          }
        });

   // _getUserInfo();
    _currentindex = widget.index ??
        0; // if index in not defined than it it automatically start from zero
    _title = widget.index == null ? "Home" : "Investment";
    super.initState();
  }


  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  final List<Widget> _children = [
   /* HomePage(),
    FeedPage(),
    UploadPage(),
    ProfilePage()*/

  ];

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return WillPopScope(
        onWillPop: () {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to Exit'),
              actions: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text("NO"),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => SystemNavigator.pop(),
                  child: Text("YES"),
                ),
              ],
            ),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/image.png"),
                          )),
                      child: Text(""),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListView(children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _currentindex = 0;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text("Feed"),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _currentindex = 1;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.newspaper),
                      title: Text("Upload"),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _currentindex = 2;
                        });
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text("Profile"),
                      onTap: () {
                        // Navigator.of(context).pop();
                        // setState(() {
                        //   _currentindex = 3;
                        // });
                      //  Navigator.pushReplacementNamed(context, LoginScreen.id);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.signOutAlt),
                      title: Text("Logout"),
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text('Do you want to Log out'),
                            actions: <Widget>[
                              GestureDetector(
                                // onTap: () => Navigator.of(context).pop(false),
                                onTap: () => SystemNavigator.pop(),
                                child: Text("NO"),
                              ),
                              SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => _onLogout(),
                                child: Text("YES"),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ]),
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: kColorPrimary,
            // automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              _title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: _isNetworkConnected
              ? SafeArea(child: _children[_currentindex])
              : Container(
            child: Center(
                child: Image.asset('images/no_internet.png')),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) => onTabTapped(index),
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black26,
            selectedItemColor: kColorPrimary,

            currentIndex:
            _currentindex, //this will be set when a new tab is tapped

            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("images/home.png"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: AppSizes.blockSizeVertical * 1.2,
                      ),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("images/feed.png"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(

                      "Feed",
                      style: TextStyle(
                        fontSize: AppSizes.blockSizeVertical * 1.2,
                      ),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("images/upload.png"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(

                      "Upload",
                      style: TextStyle(
                        fontSize: AppSizes.blockSizeVertical * 1.2,
                      ),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("images/profile.png"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(

                      "Profile",
                      style: TextStyle(
                        fontSize: AppSizes.blockSizeVertical * 1.2,
                      ),
                    ),
                  )),

            ],
          ),
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentindex = index;
      switch (index) {
        case 0:
          {
            _title = 'Home';
          }
          break;
        case 1:
          {
            _title = 'Feed';
          }
          break;
        case 2:
          {
            _title = 'Upload';
          }
          break;
        case 3:
          {
            _title = 'Profile';
          }
          break;
      }
    });
  }

  _onLogout() async {
   /* SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('data');*/

    SystemNavigator.pop();
    // Router.navigator.pushNamed(Router.welcomePage);
  }
}
