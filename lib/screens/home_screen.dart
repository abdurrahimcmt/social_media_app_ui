import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app_ui/data/data.dart';
import 'package:social_media_app_ui/models/user_model.dart';
import 'package:social_media_app_ui/widgets/build_circleimage.dart';
import 'package:social_media_app_ui/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HANGOUTS',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
            letterSpacing: 5,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          tabs: const <Widget>[
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10),
                child: Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  height: 80.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = users[index];
                      return GestureDetector(
                        onTap: () {},
                        child: BuildCircleImage(
                          image: user.profileImageUrl,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          PostCarousel(
              pageController: _pageController, title: 'Posts', posts: posts),
        ],
      ),
    );
  }
}
