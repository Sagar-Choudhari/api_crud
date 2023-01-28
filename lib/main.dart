import 'package:flutter/services.dart';
import 'package:api_crud/models/users.dart';
import 'package:api_crud/services/remote.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const MyHomePage(title: 'Fake API CRUD'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from api
    getData();
  }

  getData() async {
    users = await BaseClient().get();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  postData(user) async {
    var result = await BaseClient().post(user);
    if (result != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  putData(user, id) async {
    var result = await BaseClient().put(user, id);
    if (result != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  deleteData(id) async {
    var result = await BaseClient().delete(id);
    if (result != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _addFName = TextEditingController();
  final TextEditingController _addLName = TextEditingController();
  final TextEditingController _addPnum = TextEditingController();
  final TextEditingController _addCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      backgroundColor: NeumorphicColors.background,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Contact',
        elevation: 10,
        child: Container(
          height: 200,
          width: 200,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFBEBEBE),
                  offset: Offset(10, 10),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ]),
          child: const Center(
            child: Icon(
              Icons.add,
            ),
          ),
        ),
        onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    backgroundColor: NeumorphicColors.background,
                    title: const Text('Add New Contact'),
                    content: SizedBox(
                      width: double.maxFinite,
                      height: 368,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8.0)),
                                  depth: -3,
                                  intensity: 0.90,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 1, 1, 0),
                                  child: TextFormField(
                                    controller: _addFName,
                                    decoration: const InputDecoration(
                                      focusColor: Colors.blue,
                                      border: InputBorder.none,
                                      // icon: Icon(Icons.person),
                                      labelText: 'Firstname',
                                      hintText: 'Enter firstname',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8.0)),
                                  depth: -3,
                                  intensity: 0.90,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 1, 1, 0),
                                  child: TextFormField(
                                    controller: _addLName,
                                    decoration: const InputDecoration(
                                      focusColor: Colors.blue,
                                      border: InputBorder.none,
                                      // icon: Icon(Icons.person),
                                      labelText: 'Lastname',
                                      hintText: 'Enter lastname',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8.0)),
                                  depth: -3,
                                  intensity: 0.90,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 1, 1, 0),
                                  child: TextFormField(
                                    controller: _addPnum,
                                    keyboardType: TextInputType.number,
                                    maxLength: 12,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                      focusColor: Colors.blue,
                                      border: InputBorder.none,
                                      // icon: Icon(Icons.person),
                                      labelText: 'Phone Number',
                                      hintText: 'Enter phone number',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,5,0,5),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8.0)),
                                  depth: -3,
                                  intensity: 0.90,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 1, 1, 0),
                                  child: TextFormField(
                                    controller: _addCity,
                                    decoration: const InputDecoration(
                                      focusColor: Colors.blue,
                                      border: InputBorder.none,
                                      // icon: Icon(Icons.person),
                                      labelText: 'City',
                                      hintText: 'Enter city name',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 12.0, right: 10.0),
                        child: NeumorphicButton(
                          style: const NeumorphicStyle(
                            color: Colors.red,
                            shadowDarkColor: Colors.redAccent,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 12.0, right: 10.0),
                        child: NeumorphicButton(
                          style: const NeumorphicStyle(
                            color: Colors.green,
                            shadowDarkColor: Colors.green,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );

                              var afname = _addFName.text;
                              var alname = _addLName.text;
                              var apnum = _addPnum.text;
                              var acity = _addCity.text;

                              var user = User(
                                  firstname: afname,
                                  lastname: alname,
                                  phoneNumber: int.parse(apnum),
                                  city: acity);

                              postData(user);
                              Navigator.pop(context);
                              _addFName.clear();
                              _addLName.clear();
                              _addPnum.clear();
                              _addCity.clear();
                              setState(() {
                                isLoaded = false;
                              });
                              getData();
                            }
                          },
                          child: const Text('ADD'),
                        ),
                      ),
                    ],
                  ));
        },
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                itemCount: users?.length,
                itemBuilder: (context, index) {
                  final upFName =
                      TextEditingController(text: users![index].firstname);
                  final upLName =
                      TextEditingController(text: users![index].lastname);
                  final upPnum = TextEditingController(
                      text: users![index].phoneNumber.toString());
                  final upCity =
                      TextEditingController(text: users![index].city);

                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Neumorphic(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFBEBEBE),
                                      offset: Offset(5, 5),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5, -5),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ]),
                              child: Center(child: Text('${index + 1}')),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${users![index].firstname} ${users![index].lastname}',
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '📞 ${users![index].phoneNumber} | 🏡 ${users![index].city}',
                                  ),
                                ],
                              ),
                            ),
                            Row(children: [
                              IconButton(
                                onPressed: () {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            backgroundColor:
                                                NeumorphicColors.background,
                                            title: const Text('Update'),
                                            content: SizedBox(
                                              width: double.maxFinite,
                                              height: 310,
                                              child: Form(
                                                key: _formKey,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(0,5,0,5),
                                                      child: Neumorphic(
                                                        style: NeumorphicStyle(
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          depth: -3,
                                                          intensity: 0.90,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 1, 1, 0),
                                                          child: TextFormField(
                                                            controller: upFName,
                                                            decoration:
                                                                const InputDecoration(
                                                              focusColor:
                                                                  Colors.blue,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              // icon: Icon(Icons.person),
                                                              labelText:
                                                                  'Firstname',
                                                              hintText:
                                                                  'Enter firstname',
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter some text';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0,5,0,5),
                                                      child: Neumorphic(
                                                        style: NeumorphicStyle(
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          depth: -3,
                                                          intensity: 0.90,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 1, 1, 0),
                                                          child: TextFormField(
                                                            controller: upLName,
                                                            decoration:
                                                                const InputDecoration(
                                                              focusColor:
                                                                  Colors.blue,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              // icon: Icon(Icons.person),
                                                              labelText:
                                                                  'Lastname',
                                                              hintText:
                                                                  'Enter lastname',
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter some text';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0,5,0,5),
                                                      child: Neumorphic(
                                                        style: NeumorphicStyle(
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          depth: -3,
                                                          intensity: 0.90,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 1, 1, 0),
                                                          child: TextFormField(
                                                            controller: upPnum,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            maxLength: 12,
                                                            inputFormatters: <
                                                                TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                            ],
                                                            decoration:
                                                                const InputDecoration(
                                                              focusColor:
                                                                  Colors.blue,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              // icon: Icon(Icons.person),
                                                              labelText:
                                                                  'Phone Number',
                                                              hintText:
                                                                  'Enter phone number',
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter some text';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0,5,0,5),
                                                      child: Neumorphic(
                                                        style: NeumorphicStyle(
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0)),
                                                          depth: -3,
                                                          intensity: 0.90,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  12, 1, 1, 0),
                                                          child: TextFormField(
                                                            controller: upCity,
                                                            decoration:
                                                                const InputDecoration(
                                                              focusColor:
                                                                  Colors.blue,
                                                              border: InputBorder.none,
                                                              // icon: Icon(Icons.person),
                                                              labelText: 'City',
                                                              hintText:
                                                                  'Enter city name',
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter some text';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12.0, right: 10.0),
                                                child: NeumorphicButton(
                                                  style: const NeumorphicStyle(
                                                    color: Colors.red,
                                                    shadowDarkColor:
                                                        Colors.redAccent,
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Cancel'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 12.0, right: 10.0),
                                                child: NeumorphicButton(
                                                  style: const NeumorphicStyle(
                                                    color: Colors.green,
                                                    shadowDarkColor:
                                                        Colors.green,
                                                  ),
                                                  onPressed: () {
                                                    // Validate returns true if the form is valid, or false otherwise.
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      // If the form is valid, display a snackbar. In the real world,
                                                      // you'd often call a server or save the information in a database.
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Processing Data')),
                                                      );

                                                      var userId =
                                                          '/${users![index].id}';
                                                      var ufname = upFName.text;
                                                      var ulname = upLName.text;
                                                      var upnum = upPnum.text;
                                                      var ucity = upCity.text;

                                                      var user = User(
                                                          firstname: ufname,
                                                          lastname: ulname,
                                                          phoneNumber:
                                                              int.parse(upnum),
                                                          city: ucity);

                                                      putData(user, userId);
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        isLoaded = false;
                                                      });
                                                      getData();
                                                    }
                                                  },
                                                  child: const Text('SAVE'),
                                                ),
                                              ),
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet<String?>(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(8.0))),
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      isDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10.0),
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8.0)),
                                                depth: -3,
                                                intensity: 0.90,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.red,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(8.0)),
                                                child: Neumorphic(
                                                  style: NeumorphicStyle(
                                                    boxShape: NeumorphicBoxShape
                                                        .roundRect(
                                                        BorderRadius
                                                            .circular(
                                                            8.0)),
                                                    depth: -10,
                                                    intensity: 1,
                                                  ),
                                                  child: ListView(
                                                    shrinkWrap: true,
                                                    primary: true,
                                                    children: <Widget>[
                                                      const ListTile(
                                                        dense: true,
                                                        title: Text(
                                                          'Warning!!',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      const ListTile(
                                                        dense: true,
                                                        title: Text(
                                                            'Do you really want to delete this?'),
                                                      ),
                                                      ButtonBar(
                                                        children: <Widget>[
                                                          NeumorphicButton(
                                                            style: const NeumorphicStyle(
                                                              color: Colors.red,
                                                              shadowDarkColor:
                                                              Colors.redAccent,
                                                            ),
                                                            onPressed: () {
                                                              var userId =
                                                                  '/${users![index].id}';
                                                              deleteData(userId);
                                                              setState(() {
                                                                isLoaded = false;
                                                              });
                                                              getData();
                                                              Navigator.pop(context);
                                                            },
                                                            child: const Text('YES'),
                                                          ),
                                                          Container(width: 5,),
                                                          NeumorphicButton(
                                                            style: const NeumorphicStyle(
                                                              color: Colors.green,
                                                              shadowDarkColor:
                                                              Colors.green,
                                                            ),
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text('NO'),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
