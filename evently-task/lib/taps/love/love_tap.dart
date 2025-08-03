import 'package:evently_application/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DefaultTextFormField(
              hintText: "Search for Event",
              prefixIconImageName: "search",
              onChange: (query) {},
            ),
            SizedBox(height: 16),
            // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: (_, index) => EventItem(),
            //     separatorBuilder: (_, _) => SizedBox(height: 16,),
            //     itemCount: 20,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
