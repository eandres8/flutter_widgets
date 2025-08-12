import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_rounded),
              label: Text('Elevated icon'),
            ),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.accessibility_new), label: Text('Filled Icon'),),
            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            OutlinedButton.icon(onPressed: () {}, label: Text('Outlined Icon'), icon: const Icon(Icons.terminal)),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(onPressed: () {}, label: Text('Text Button'), icon: const Icon(Icons.account_box_outlined)),

            // Custom Button
            const CustomButton(),

            IconButton(onPressed: () {}, icon: Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: const Text('Hello word', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
