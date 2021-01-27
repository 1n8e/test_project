import 'dart:async';

import 'package:bloc/bloc.dart';
import 'file:///C:/Users/natem/dev/test_project/lib/data/contacts_data.dart';
import 'package:test_project/models/contacts_model.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial());
  ContactsDataSource contactsDataSource = ContactsDataSource();

  @override
  Stream<ContactsState> mapEventToState(
    ContactsEvent event,
  ) async* {
    if (event is GetContactsEvent) {
      yield ContactsLoading();
      try {
        final List<Contacts> contacts = await contactsDataSource.getContacts();
        yield ContactsSuccess(contacts);
      } catch (e) {
        yield ContactsFailure(e.toString());
      }
    }
  }
}
