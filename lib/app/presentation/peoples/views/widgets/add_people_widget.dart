import 'dart:math';
import 'package:flutter/material.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_bloc.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_event.dart';
import '../../../../data/models/people_model.dart';

class AddPeopleWidget extends StatelessWidget {
  const AddPeopleWidget({
    super.key,
    required this.bloc,
  });
  final PeopleBloc bloc;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final genreController = TextEditingController();
    final ageController = TextEditingController();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                  ),
                  const Text('Nome'),
                  TextFormField(
                    controller: genreController,
                  ),
                  const Text('Sexo'),
                  TextFormField(
                    controller: ageController,
                  ),
                  const Text('Idade'),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      final item = PeopleModel(
                        id: Random().nextInt(100).toString(),
                        title: nameController.text,
                        age: ageController.text,
                        genre: genreController.text,
                      );
                      bloc.inputPeople.add(AddPeople(people: item));
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        size: 50,
      ),
    );
  }
}
