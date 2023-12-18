import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).currentUser;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final role = snapshot.data.get('role');

          if (role == 'vendor') {
            return InvestPromotePage();
          } else {
            return Center(child: Text('Access denied'));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Auth {
}

class Provider {
}