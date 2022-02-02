import 'package:flutter/material.dart';
import 'package:social_media_app_ui/models/user_model.dart';

class BuildCircleImage extends StatelessWidget {
  final User user;
  const BuildCircleImage({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 30,
          child: CircleAvatar(
            radius: 28.0,
            backgroundImage: AssetImage(user.profileImageUrl),
          ),
        ),
      ),
    );
  }
}
