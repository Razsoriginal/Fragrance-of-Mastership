import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/constants/sizes.dart';
import 'package:fragrance_of_mastership/screens/events/home/components/quiz_list.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../controllers/services/events/provider/events_provider.dart';
import '../../../home/home_page/components/hero_banner.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const HeroBanner(
          heroTitle: 'Engage Your Intellect',
          herSubTitle: 'Islamic Insights',
          heroGradient: fCardGradientColor,
        ),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        Consumer<EventsProvider>(
          builder: (context, eventsProvider, child) {
            if (eventsProvider.event.isEmpty) {
              eventsProvider.loadQuizzes();
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: eventsProvider.event.map((event) {
                  return EventsList(
                    date: event.startDate
                        .toLocal()
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                    subject: event.subject,
                    quizClass: event.fClass,
                    title: event.title,
                    description: event.description,
                    id: event.id,
                    image: event.image,
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
