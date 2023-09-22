import 'package:flutter/material.dart';
import '../../../../data/models/people_model.dart';
import '../../bloc/people_bloc.dart';
import 'people_item_widget.dart';

class ListPeopleWidget extends StatelessWidget {
  const ListPeopleWidget({
    super.key,
    required this.peoples,
    required this.bloc,
  });
  final PeopleBloc bloc;

  final List<PeopleModel> peoples;

  @override
  Widget build(BuildContext context) {
    return peoples.isEmpty
        ? const Center(
            child: Text('Não há dados para exibir'),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => PeopleItemWidget(
              people: peoples[index],
              bloc: bloc,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: peoples.length,
          );
  }
}
