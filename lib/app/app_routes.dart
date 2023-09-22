import 'package:flutter/material.dart';
import 'presentation/home/views/pages/home_page.dart';
import 'presentation/peoples/views/pages/list_people_page.dart';
import 'presentation/peoples/views/pages/people_details_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get all => {
        '/home': (context) => const HomePage(),
        '/list-people-page': (context) => const ListPeoplePage(),
        '/people-details-page': (context) => PeopleDetailsPage(
              people: getArgs(context),
            ),
      };

  static dynamic getArgs(context) => ModalRoute.of(context)?.settings.arguments;
}
