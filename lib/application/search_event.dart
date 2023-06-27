part of 'search_bloc.dart';

class SearchEvent {}

class InitialResponse extends SearchEvent {
  String query;
  InitialResponse({required this.query});
}
