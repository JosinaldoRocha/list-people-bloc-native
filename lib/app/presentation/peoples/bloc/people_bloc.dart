import 'dart:async';
import 'package:list_people_blco_native/app/data/models/people_model.dart';
import 'package:list_people_blco_native/app/data/repositories/people_repository.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_event.dart';
import 'package:list_people_blco_native/app/presentation/peoples/bloc/people_state.dart';

class PeopleBloc {
  final _repository = PeopleRepository();

  final _inputPeopleController = StreamController<PeopleEvent>();
  final _outputPeopleController = StreamController<PeopleState>();

  Sink<PeopleEvent> get inputPeople => _inputPeopleController.sink;
  Stream<PeopleState> get outputPeople => _outputPeopleController.stream;

  PeopleBloc() {
    _inputPeopleController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(PeopleEvent event) async {
    List<PeopleModel> peoples = [];

    _outputPeopleController.add(PeopleLoadingState());

    if (event is GetAllPeople) {
      peoples = await _repository.getAll();
    } else if (event is AddPeople) {
      peoples = await _repository.addPeople(event.people);
    } else if (event is DeletePeople) {
      _repository.deletePeople(event.people);

      peoples = await _repository.getAll();
    }

    _outputPeopleController.add(PeopleSuccessState(people: peoples));
  }
}
