part of 'contacts_bloc.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsSuccess extends ContactsState {
  final List<Contacts> contacts;

  ContactsSuccess(this.contacts);
}

class ContactsFailure extends ContactsState {
  final String error;

  ContactsFailure(this.error);
}
