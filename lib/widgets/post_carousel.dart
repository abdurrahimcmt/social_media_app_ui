import 'package:flutter/material.dart';
import 'package:social_media_app_ui/models/post_model.dart';

class PostCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;
  const PostCarousel(
      {Key? key,
      required this.pageController,
      required this.title,
      required this.posts})
      : super(key: key);

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: child,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 400.0,
                width: 300.0,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10.0,
            right: 10.0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: 110.0,
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.location,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            post.likes.toString(),
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            post.comments.toString(),
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 400.0,
          child: PageView.builder(
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        ),
      ],
    );
  }
}
