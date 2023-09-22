import 'package:list_people_blco_native/app/data/models/people_model.dart';

abstract class PeopleState {
  final List<PeopleModel> peoples;
  PeopleState({required this.peoples});
}

class PeopleInitialState extends PeopleState {
  PeopleInitialState() : super(peoples: []);
}

class PeopleLoadingState extends PeopleState {
  PeopleLoadingState() : super(peoples: []);
}

class PeopleSuccessState extends PeopleState {
  final List<PeopleModel> people;
  PeopleSuccessState({required this.people}) : super(peoples: people);
}

class PeopleFailureState extends PeopleState {
  final Exception error;
  PeopleFailureState({required this.error}) : super(peoples: []);
}
