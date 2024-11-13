import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Identitas',
      home: IdentitasListPage()
    );
  }  
}

class IdentitasListPage extends StatelessWidget{
  final List<Map<String, dynamic>> Identitas = [
    {
      'title': 'Naufal Wafi Hermawan',
      'description': '5026201075',
      'imageUrl': 'https://media.licdn.com/dms/image/v2/D5603AQEi1cQ-gqLCBA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1702029984731?e=1736985600&v=beta&t=lTG22deGbQO_NslKgmY_Uzd7LkedkPkHeHGWZc8D960',
      'Identitas': [
        'Nama : Naufal Wafi Hermawan',
        'Nrp  : 5026201075',
      ],
      'funfact': [
        'Multitasking',
        'Tech Enthusiast',
        'Play More than 5 Sports',
      ]

    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diriku'),
      ),
      body: ListView.builder(
        itemCount: Identitas.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.orange.shade100,
            child: ListTile(
              leading: Image.network(
                Identitas[index]['imageUrl']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                  Identitas[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                Identitas[index]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdentitasDetailPage(Identitas: Identitas[index]),
                    )
                );
              }
              )
              );
            },
          )
        );  
  }
}

class IdentitasDetailPage extends StatelessWidget {
  final Map<String, dynamic> Identitas;

  IdentitasDetailPage({required this.Identitas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Identitas['title']!),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Identitas['imageUrl']!,
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            Identitas['title']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          Text(
            Identitas['description']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Fun Fact',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Identitas['funfact'].length,
            itemBuilder: (context, index) {
              return Text(
                '-${Identitas['funfact'][index]}',
                style: TextStyle(fontSize: 16),
              );
            }
          )

        ],
      )
      )
    );
  }
}