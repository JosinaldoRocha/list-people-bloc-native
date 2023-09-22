import 'package:list_people_blco_native/app/data/models/people_model.dart';

abstract class PeopleEvent {}

class GetAllPeople extends PeopleEvent {}

class AddPeople extends PeopleEvent {
  final PeopleModel people;

  AddPeople({required this.people});
}

class DeletePeople extends PeopleEvent {
  final PeopleModel people;

  DeletePeople({required this.people});
}
