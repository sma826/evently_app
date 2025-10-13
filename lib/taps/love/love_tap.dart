import 'package:evently_application/providers/evrnts_provider.dart';
import 'package:evently_application/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/event_item.dart';

class LoveTab extends StatefulWidget {
  const LoveTab({super.key});

  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  late EventsProvider eventsProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventsProvider.filterFavouriteEvents([]);
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);

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
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) =>
                    EventItem(eventsProvider.favouriteEvents[index]),
                separatorBuilder: (_, _) => SizedBox(height: 16,),
                itemCount: eventsProvider.favouriteEvents.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
