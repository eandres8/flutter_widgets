import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Search food',
    caption:
        'Tempor occaecat velit duis ut eu. Aliqua laborum enim commodo minim amet cillum. Amet nostrud proident culpa sit est fugiat est voluptate est fugiat. Dolor sint ut nostrud non consequat et. Deserunt quis consectetur exercitation consequat nisi magna non eu sunt aliqua eiusmod. Ea Lorem sint dolore anim id irure reprehenderit occaecat amet et excepteur. Aliquip et fugiat Lorem adipisicing ipsum duis id proident deserunt.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Fast Food',
    caption:
        'Eiusmod consectetur deserunt laboris non consectetur tempor ad ut veniam eu culpa. Enim aute deserunt non eu elit quis sint fugiat elit culpa do cillum eu sunt. Voluptate anim cupidatat excepteur tempor sint laborum. Ullamco esse elit excepteur enim consequat ad proident non nulla. Cillum ex cupidatat elit enim laboris. In exercitation deserunt sunt laboris aute occaecat magna incididunt fugiat aliquip. Nostrud cillum incididunt dolore mollit dolore occaecat reprehenderit velit sunt.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Enjoy food',
    caption:
        'Commodo dolore irure amet deserunt anim sunt consectetur amet laborum non.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('skip'),
            ),
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(onPressed: () => context.pop(), child: const Text('start'))
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme(:bodyLarge, :titleLarge) = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleLarge),
          const SizedBox(height: 10),
          Text(caption, style: bodyLarge),
        ],
      ),
    );
  }
}
