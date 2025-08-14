import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = true;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged:(value) =>
            setState(() {
              isDeveloper = !isDeveloper;
            }),
          title: const Text('Developer mode'),
          subtitle: const Text('Aditional controlers'),
        ),

        // Radio Buttons

        ExpansionTile(
          title: const Text('Transport vehicle'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
              title: const Text('Cars'),
              subtitle: const Text('Travel by car'),
            ),
            RadioListTile(
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
              title: const Text('Boats'),
              subtitle: const Text('Travel by boat'),
            ),
            RadioListTile(
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
              title: const Text('Planes'),
              subtitle: const Text('Travel by plane'),
            ),
            RadioListTile(
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
              title: const Text('Submarines'),
              subtitle: const Text('Travel by submarine'),
            ),
          ],
        ),

        // CheckList
        CheckboxListTile(
          value: wantsBreakfast,
          onChanged: (context) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
          title: const Text('Do you want Breakfast?'),
        ),
        CheckboxListTile(
          value: wantsLunch,
          onChanged: (context) => setState(() {
            wantsLunch = !wantsLunch;
          }),
          title: const Text('Do you want Lunch?'),
        ),
        CheckboxListTile(
          value: wantsDinner,
          onChanged: (context) => setState(() {
            wantsDinner = !wantsDinner;
          }),
          title: const Text('Do you want Dinner?'),
        ),
      ],
    );
  }
}