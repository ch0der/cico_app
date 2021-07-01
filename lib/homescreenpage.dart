import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 50,
              child: DrawerHeader(
                child: Text('header'),
              ),
            ),
            ListTile(
              title: Text('test'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[200],
      body: body(),
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          AppLogo(size: 75),
          title(),
          Container(height: 100,),
          AddCalories(),
        ],
      ),
    );
  }

  buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 100)),
        title(),
        loginButtons(),
        guestButton(),
      ],
    );
  }

  guestButton() {
    return HomeButton(
      HomeButtonContainer(
        text: 'Guest',
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/movie_list',
          );
        },
      ),
    );
  }

  loginButtons() {
    return Column(
      children: [
        Container(
          height: 20,
        ),
        loginButton('Login'),
        Container(
          height: 10,
        ),
        loginButton('Register'),
        Container(
          height: 10,
        ),
      ],
    );
  }

  title() {
    return Container(
      height: 50,
      child: Text(
        'Cico',
        style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'Nerko',
            shadows: [
              Shadow(offset: Offset(1, 3), blurRadius: 2, color: Colors.black54)
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }

  loginButton(String text) {
    return Container(
      width: 275,
      height: 50,
      child: RaisedButton(
        elevation: 8,
        color: Colors.white,
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class HomeButtonContainer {
  final String text;
  final Function onPressed;

  HomeButtonContainer({this.text, this.onPressed});
}

class HomeButton extends StatelessWidget {
  final HomeButtonContainer _model;
  HomeButton(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 50,
      child: RaisedButton(
        color: Colors.white,
        elevation: 8,
        onPressed: _model.onPressed,
        child: Center(
          child: Text(
            _model.text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  AppLogo({@required this.size});
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: icon(),
    );
  }

  icon() {
    return Stack(
      children: [
        Container(
            height: size,
            width: size,
            child: Image.asset(
              "assets/images/cicoLogo.png",
              color: Colors.black87,
            )),
        Positioned(
          right: size / 50,
          bottom: size / 25,
          child: Container(
            height: size,
            width: size,
            child: logo(),
          ),
        ),
      ],
    );
  }

  logo() {
    String image = "assets/images/";
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/cicoLogo.png",
          ),
        ),
      ),
    );
  }
}

class AddCalories extends StatefulWidget {
  @override
  _AddCaloriesState createState() => _AddCaloriesState();
}

class _AddCaloriesState extends State<AddCalories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 45,
        ),

      ),
    );
  }
}

