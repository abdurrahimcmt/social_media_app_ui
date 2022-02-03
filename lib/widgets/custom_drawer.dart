import 'package:flutter/material.dart';
import 'package:social_media_app_ui/data/data.dart';
import 'package:social_media_app_ui/screens/home_screen.dart';
import 'package:social_media_app_ui/screens/login_screen.dart';
import 'package:social_media_app_ui/screens/profile_screen.dart';
import 'package:social_media_app_ui/widgets/build_circleimage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(
    Icon icon,
    String title,
    Function() onTap,
  ) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(
                  currentUser.backgroundImageUrl,
                ),
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BuildCircleImage(
                      image: currentUser.profileImageUrl,
                      radius: 50,
                      border: 2.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.chat),
            'Chats',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.map),
            'Map',
            () {},
          ),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.settings),
            'Setting',
            () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.run_circle),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
