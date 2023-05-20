import 'package:flutter/material.dart';
import 'comment_service.dart';
import 'models/comment_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Comment>>(
          future: fetchComments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final comments = snapshot.data!;
              return ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return InfoCard(
                    title: comment.name,
                    body: comment.body,
                    email: comment.email,
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No comments found'),
              );
            }
          },
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  const InfoCard(
      {super.key,
      required this.title,
      required this.body,
      required this.email});
  final String title;
  final String body;
  final String email;
  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Text(widget.email),
                ],
              ),
            ),
            Text(
              widget.body,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
