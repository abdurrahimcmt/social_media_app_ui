import 'package:flutter/material.dart';
import 'package:social_media_app_ui/models/user_model.dart';
import 'package:social_media_app_ui/widgets/build_circleimage.dart';
import 'package:social_media_app_ui/widgets/custom_drawer.dart';
import 'package:social_media_app_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                    ),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: BuildCircleImage(
                    image: widget.user.profileImageUrl,
                    radius: 50,
                    border: 0.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
