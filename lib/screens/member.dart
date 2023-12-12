import 'package:flutter/material.dart';

class MembersTab extends StatelessWidget {
  final List<Member> members = [
    Member(
      name: 'Ayush Singh',
      photoUrl: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FScreenshot%202023-12-13%20at%2012.07.53%E2%80%AFAM.png?alt=media&token=5810fe5a-5ca5-46c1-b225-1d5ad6e232af',
      socialMediaHandle: '@ayushsingh_235',
      description: 'A dedicated writer, skilled in crafting compelling narratives that transport readers to captivating worlds and provoke introspection through the artful use of language.',
      year: 2023,
    ),
    Member(
      name: 'Saksham Bharadwaj',
      photoUrl: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FIMG-20231026-WA0026.jpg?alt=media&token=8e73bbfc-1228-4697-b0e3-4c2034fa015c',
      socialMediaHandle: '@sakshambharadwaj18',
      description: 'Writers are wordsmiths who weave the fabric of human experience through the art of storytelling. Armed with pens and keyboards, writers craft narratives that traverse the realms of fiction, non-fiction, poetry, and beyond, allowing readers to explore diverse perspectives and realities.',
      year: 2022,
    ),
    Member(
      name: 'Anshika Singh',
      photoUrl: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FPXL_20231023_140202542~2.jpg?alt=media&token=3005e683-9ccb-494a-aec0-976190a741cf',
      socialMediaHandle: '@anshhhikaaaa',
      description: 'A dedicated writer, skilled in crafting compelling narratives that transport readers to captivating worlds and provoke introspection through the artful use of language.',
      year: 2023,
    ),
    Member(
      name: 'Shreya Singh',
      photoUrl: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FIMG-20230125-WA0023.jpg?alt=media&token=cb443542-c279-4676-b552-5699808107bd',
      socialMediaHandle: '@aryansh_mishra.10',
      description: 'Writers are wordsmiths who weave the fabric of human experience through the art of storytelling. Armed with pens and keyboards, writers craft narratives that traverse the realms of fiction, non-fiction, poetry, and beyond, allowing readers to explore diverse perspectives and realities.',
      year: 2022,
    ),
    Member(
      name: 'Gaurav Singh ',
      photoUrl: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FScreenshot%202023-12-12%20at%2011.57.59%E2%80%AFPM.png?alt=media&token=0e7debb7-1aa6-4289-888d-f31ae1519a82',
      socialMediaHandle: '@aryansh_mishra.10',
      description: 'Writers are wordsmiths who weave the fabric of human experience through the art of storytelling. Armed with pens and keyboards, writers craft narratives that traverse the realms of fiction, non-fiction, poetry, and beyond, allowing readers to explore diverse perspectives and realities.',
      year: 2022,
    ),
    // Add more members as needed
  ];

  @override
  Widget build(BuildContext context) {
    // Sort members by year in descending order
    members.sort((a, b) => b.year.compareTo(a.year));

    return Scaffold(
      body: ListView.builder(
        itemCount: (members.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstIndex = index * 2;
          final int secondIndex = index * 2 + 1;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: MemberCard(member: members[firstIndex]),
                ),
                SizedBox(width: 8), // Add spacing between cards
                Expanded(
                  child: secondIndex < members.length
                      ? MemberCard(member: members[secondIndex])
                      : SizedBox.shrink(), // Hide if there is no second member
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member member;

  MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          _showMemberDetailsDialog(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                image: DecorationImage(
                  image: NetworkImage(
                    member.photoUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    member.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    member.socialMediaHandle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMemberDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(member.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(member.photoUrl),
              ),
              SizedBox(height: 16),
              Text(
                'Social Media Handle: ${member.socialMediaHandle}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Description: ${member.description}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class Member {
  final String name;
  final String photoUrl;
  final String socialMediaHandle;
  final String description;
  final int year; // Added year property

  Member({
    required this.name,
    required this.photoUrl,
    required this.socialMediaHandle,
    required this.description,
    required this.year,
  });
}
