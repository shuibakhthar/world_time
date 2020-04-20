import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;
    print(data);

    String bgimg = data['isDay'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDay'] ? Colors.blue[400]: Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('img/$bgimg'),
              fit: BoxFit.cover,)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {'time':result['time'],
                         'location':result['location'],
                         'flag':result['flag'],
                         'isDay':result['isDay'],
                         };
                       });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[200],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 66.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
      )
    );

  }
}