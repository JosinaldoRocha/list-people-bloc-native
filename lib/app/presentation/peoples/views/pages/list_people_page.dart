import 'package:flutter/material.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_bloc.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_event.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_state.dart';
import '../widgets/add_people_widget.dart';
import '../widgets/list_people_widget.dart';

class ListPeoplePage extends StatefulWidget {
  const ListPeoplePage({super.key});

  @override
  State<ListPeoplePage> createState() => _ListPeoplePageState();
}

class _ListPeoplePageState extends State<ListPeoplePage> {
  //late final PeopleBloc;

  final _peopleBloc = PeopleBloc();
  @override
  void initState() {
    super.initState();
    //_peopleBloc = PeopleBloc();
    _peopleBloc.inputPeople.add(GetAllPeople());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PeopleState>(
      stream: _peopleBloc.outputPeople,
      builder: (context, state) {
        if (state.data is PeopleLoadingState) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.data is PeopleSuccessState) {
          final peoples = state.data?.peoples ?? [];

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: ListPeopleWidget(
                peoples: peoples,
                bloc: _peopleBloc,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: AddPeopleWidget(bloc: _peopleBloc),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
