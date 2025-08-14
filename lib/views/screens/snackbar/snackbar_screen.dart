import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Wooba looba dub dub'),
        action: SnackBarAction(label: 'Burp!', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Reprehenderit laborum irure velit Lorem tempor et labore aliqua reprehenderit officia eiusmod. Anim cillum amet cillum aliqua. Duis ad mollit officia id sit anim adipisicing labore mollit cupidatat laborum ipsum. Deserunt excepteur consectetur amet consectetur laboris incididunt cupidatat magna non. Officia eiusmod exercitation deserunt magna exercitation magna tempor cupidatat nostrud ea. Aliquip veniam exercitation aute aute eu tempor irure cillum nulla aliquip pariatur. Officia veniam non consequat reprehenderit pariatur in consectetur laborum ut mollit labore consectetur duis.'),
        actions: [
          TextButton(onPressed: () {
            context.pop();
          }, child: const Text('Cancel')),
          FilledButton(onPressed: () {}, child: const Text('Accept')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Consectetur amet laboris qui sint quis aliquip mollit ullamco esse. Quis labore nisi incididunt exercitation non sunt veniam irure officia. Adipisicing elit pariatur ea cillum. Veniam nisi fugiat et proident eu et exercitation enim eu.',
                    ),
                  ],
                );
              },
              child: const Text('Used Licenses'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Show snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
    );
  }
}
