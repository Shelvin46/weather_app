part of 'search_bloc.dart';

class SearchEvent {}

class InitialResponse extends SearchEvent {
  String query;
  InitialResponse({required this.query});
}

class SearchInitialize extends SearchEvent {
  String query;
  SearchInitialize({required this.query});
}
