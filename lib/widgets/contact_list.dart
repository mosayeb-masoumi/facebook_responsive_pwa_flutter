import 'package:facebook_responsive_ui_flutter/model/user_model.dart';
import 'package:facebook_responsive_ui_flutter/widgets/user_card.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  const ContactList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  )),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),

          Expanded(
              child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final User user = users[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: UserCard(user: user,),);
                    }),

          )
          

        ],
      ),
    );
  }
}
