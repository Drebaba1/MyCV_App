import 'package:flutter/material.dart';

import 'edit_cv_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              foregroundColor: Colors.black)),
      home: const CVPage(),
    );
  }
}

class CVPage extends StatefulWidget {
  const CVPage({super.key});

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  TextEditingController fullNameController =
      TextEditingController(text: "Akinyemi Damilare Michael");
  TextEditingController userNameController =
      TextEditingController(text: "Dre_");
  TextEditingController githubHandleController =
      TextEditingController(text: "drebaba1");
  TextEditingController bioBriefController = TextEditingController(
      text:
          '''I am a very passionate person who is keen on results and possesses the ability to work independently, think innovatively and work effectively within a team to achieve organizational goals. I am also a mobile developer with a year experience in building innovative and scalable mobile applications. I am passionate about solving real world problems,a good team player and can collaborate effectively.''');

  TextEditingController educationController = TextEditingController(text: '''
      Ekiti State University (EKSU)  
    2023''');
  TextEditingController experienceBriefController =
      TextEditingController(text: "drebaba1");
  TextEditingController skillController = TextEditingController(text: '''
● Problem Solving Skills,
● Creative & Critical Thinking
Skills,
● Collaboration & TeamWork
Skills,
● Adaptability,
● Conflict Resolution,
● Kotlin,
● Java,
● Dart,
● Cisco,
● Flutter''');

  navigateToEdit(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (_) => EditProfileScreen(
                fullNameController: fullNameController,
                userNameController: userNameController,
                githubHandleController: githubHandleController,
                bioBriefController: bioBriefController,
                educationController: educationController,
                skillController: skillController)))
        .whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My CV Page"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('lib/dre2.jpg'),
            radius: 70,

            // child: SizedBox(height: 20.0),
          ),
          TextBio(header: "Name", bio: fullNameController.text.trim()),
          TextBio(
              header: "Slack Username", bio: userNameController.text.trim()),
          TextBio(
              header: "GitHub Handle",
              bio: "https://github.com/${githubHandleController.text.trim()}"),
          TextBio(header: "About Me", bio: bioBriefController.text.trim()),
          TextBio(header: "Education", bio: educationController.text.trim()),
          TextBio(header: "Skills", bio: skillController.text.trim()),
          Buttons(
            text: "Edit Profile",
            onTap: () => navigateToEdit(context),
          )
        ],
      ),
    );
  }
}

class TextBio extends StatelessWidget {
  final String header;
  final String bio;

  const TextBio({Key? key, required this.header, required this.bio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$header: ",
          style: headerTextStyle,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(child: Text(bio, style: bodyTextStyle)),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

TextStyle headerTextStyle = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 18,
);
TextStyle bodyTextStyle = const TextStyle(fontSize: 17, color: Colors.black54);
