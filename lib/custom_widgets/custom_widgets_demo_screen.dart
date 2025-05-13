import 'package:flutter/material.dart';

import 'custom_dashed_line.dart';
import 'custom_interactive_rating.dart';
import 'custom_stepper.dart';
import 'custom_toggle_switch.dart';


class CustomWidgetsDemoScreen extends StatefulWidget {
  const CustomWidgetsDemoScreen({super.key});

  @override
  State<CustomWidgetsDemoScreen> createState() => _CustomWidgetsDemoScreenState();
}

class _CustomWidgetsDemoScreenState extends State<CustomWidgetsDemoScreen> {
  int currentStep = 2;
  double rating = 3;
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Widgets Demo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Step Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomStepper(currentStep: currentStep, totalSteps: 5),
            const SizedBox(height: 20),

            const Text("Rating Bar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RatingBar(
              maxRating: 5,
              currentRating: rating,
              onRatingSelected: (value) {
                setState(() => rating = value);
              },
            ),
            const SizedBox(height: 20),

            const Text("Dashed Divider", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const DashedLine(),
            const SizedBox(height: 20),

            const Text("Custom Toggle", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                CustomToggleSwitch(
                  value: toggleValue,
                  onChanged: (val) => setState(() => toggleValue = val),
                ),
                const SizedBox(width: 10),
                Text(toggleValue ? "ON" : "OFF"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
