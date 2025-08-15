import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isFetching = false;
  bool isMounted = true;

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(List.generate(5, (idx) => idx + 1 + lastId));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final ScrollPosition(:maxScrollExtent, :pixels) =
          scrollController.position;

      if ((pixels + 500) >= maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isFetching) return;

    isFetching = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isFetching = false;

    if (!isMounted) return;
    
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isFetching = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    if(!isMounted) return;

    final lastId = imagesIds.last;
    imagesIds.clear();

    imagesIds.add(lastId + 1);
    addFiveImages();
    isFetching = false;
    setState(() {});
  }

  void moveScrollToBottom() {
    final ScrollPosition(:maxScrollExtent, :pixels) =
      scrollController.position;

    if ((pixels + 100) <= maxScrollExtent) return;

    scrollController.animateTo(
      pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('InfiniteScroll'),
      // ),
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isFetching
            ? SpinPerfect(infinite: true, child: Icon(Icons.refresh))
            : FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
