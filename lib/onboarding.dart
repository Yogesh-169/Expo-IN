import 'package:flutter/material.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';

class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  // Define a single user
  final UserModel user = UserModel([
    StoryModel("https://images.unsplash.com/photo-1.jpg"),
    StoryModel("https://images.unsplash.com/photo-2.jpg"),
  ], "User1", "https://images.unsplash.com/photo-user1.jpg");

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume,
    );
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: StoryImage(
                  key: ValueKey(story.imageUrl),
                  imageProvider: NetworkImage(
                    story.imageUrl,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            // Display the button only at the end of all stories
            if (pageIndex == 0 &&
                storyIndex == user.stories.length - 1)
              Center(
                child: ElevatedButton(
                  child: const Text('Continue'),
                  onPressed: () async {
                    // Your logic to handle the button press
                  },
                ),
              ),
          ]);
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (int pageIndex) => 0, // Fixed here
        pageLength: user.stories.length, // Adjusted to user.stories.length
        storyLength: (int pageIndex) => user.stories.length,
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
