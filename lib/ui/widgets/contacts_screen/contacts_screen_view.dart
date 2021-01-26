import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/contacts/contacts_bloc.dart';
import 'package:test_project/consts/padding.dart';
import 'package:test_project/ui/screens/detailed_contact_screen.dart';
import 'package:test_project/ui/widgets/contacts_screen/contacts_card.dart';

class ContactsScreenView extends StatelessWidget {
  const ContactsScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactsBloc()..add(GetContactsEvent()),
      child: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state is ContactsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactsFailure) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is ContactsSuccess) {
            return ListView.separated(
                padding: ConstPadding.contactsListViewPadding,
                itemCount: state.contacts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailedContactScreen(
                                    contact: state.contacts[index],
                                  )));
                    },
                    child: ContactsCard(
                      contacts: state.contacts[index],
                    ),
                  );
                });
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
