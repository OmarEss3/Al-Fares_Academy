import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/header_widget.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          const Expanded(
            child: Center(
              child: Text('This Page will be available soon..'),
            ),
          ),
          CustomFooter()
        ],
      ),
    );
  }
}
