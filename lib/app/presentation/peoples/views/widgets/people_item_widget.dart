import 'package:flutter/material.dart';
import '../../../../data/models/people_model.dart';
import '../../bloc/people_bloc.dart';
import '../../bloc/people_event.dart';

class PeopleItemWidget extends StatelessWidget {
  const PeopleItemWidget({
    super.key,
    required this.people,
    required this.bloc,
  });
  final PeopleModel people;
  final PeopleBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/people-details-page',
                  arguments: people,
                );
              },
              child: Text(people.title),
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {
            bloc.inputPeople.add(DeletePeople(people: people));
          },
          child: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
