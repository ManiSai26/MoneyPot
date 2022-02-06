import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneypot/data.dart';
import 'package:moneypot/widgets/widgets.dart';
import 'package:moneypot/models/models.dart';

// class HomePage extends StatelessWidget {
//   final _food = TextEditingController();
//   final _bills = TextEditingController();
//   bool _foodisValid=true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             brightness: Brightness.light,
//             backgroundColor: data.themecolor,
//             title: Text(
//               'Money Pot',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             floating: true,
//             actions: [
//               ProfileAvatar(
//                   imageUrl:
//                       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Anonymous.svg/1481px-Anonymous.svg.png'),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: InputContainer(label: 'Food', controller: _food,isvalid:_foodisValid),
//           ),
//           SliverToBoxAdapter(
//             child: TextButton(
//               onPressed: () => {print('value:${_food.text}'),
//                },
//               child: Text('Print'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class _InputContainer extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   const _InputContainer({Key? key, required this.label, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Expenses exp;
  final _food = TextEditingController();
  bool _foodisValid = true;
  final _entertainment = TextEditingController();
  bool _entertainmentisValid = true;
  final _bill = TextEditingController();
  bool _billisValid = true;
  final _grocery = TextEditingController();
  bool _groceryisValid = true;
  final _education = TextEditingController();
  bool _educationisValid = true;

  final _transport = TextEditingController();
  bool _transportisValid = true;
  final _others = TextEditingController();
  bool _othersisValid = true;

  void validate() {
    if (double.tryParse(_food.text) == null) {
      setState(() {
        _foodisValid = false;
      });
    } else if (!_foodisValid) {
      setState(() {
        _foodisValid = true;
      });
    }
    if (double.tryParse(_entertainment.text) == null) {
      setState(() {
        _entertainmentisValid = false;
      });
    } else if (!_entertainmentisValid) {
      setState(() {
        _entertainmentisValid = true;
      });
    }
    if (double.tryParse(_bill.text) == null) {
      setState(() {
        _billisValid = false;
      });
    } else if (!_billisValid) {
      setState(() {
        _billisValid = true;
      });
    }
    if (double.tryParse(_grocery.text) == null) {
      setState(() {
        _groceryisValid = false;
      });
    } else if (!_groceryisValid) {
      setState(() {
        _groceryisValid = true;
      });
    }
    if (double.tryParse(_education.text) == null) {
      setState(() {
        _educationisValid = false;
      });
    } else if (!_educationisValid) {
      setState(() {
        _educationisValid = true;
      });
    }
    if (double.tryParse(_transport.text) == null) {
      setState(() {
        _transportisValid = false;
      });
    } else if (!_transportisValid) {
      setState(() {
        _transportisValid = true;
      });
    }
    if (double.tryParse(_others.text) == null) {
      setState(() {
        _othersisValid = false;
      });
    } else if (!_othersisValid) {
      setState(() {
        _othersisValid = true;
      });
    }
  }

  Widget inputContainer(
      {required String label,
      required TextEditingController controller,
      required bool isvalid}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          alignment: Alignment.centerLeft,
          //color: Colors.red,
          height: 100.0,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        Container(
          child: TextField(
            decoration:
                InputDecoration(errorText: isvalid ? null : 'Enter a Number'),
            controller: controller,
            // onTap: validate,
          ),
          width: 100,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? picked;
    DocumentSnapshot<Map<String, dynamic>> snapshot;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: data.themecolor,
            title: Text(
              'Money Pot',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            actions: [
              ProfileAvatar(
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Anonymous.svg/1481px-Anonymous.svg.png'),
            ],
          ),
          // SliverToBoxAdapter(
          //   child: dateContainer(),
          // ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Food', controller: _food, isvalid: _foodisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Entertainment',
                controller: _entertainment,
                isvalid: _entertainmentisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Bills', controller: _bill, isvalid: _billisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Grocery',
                controller: _grocery,
                isvalid: _groceryisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Education',
                controller: _education,
                isvalid: _educationisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Transport',
                controller: _transport,
                isvalid: _transportisValid),
          ),
          SliverToBoxAdapter(
            child: inputContainer(
                label: 'Others', controller: _others, isvalid: _othersisValid),
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () async => {
                validate(),
                if (_foodisValid &&
                    _educationisValid &&
                    _billisValid &&
                    _groceryisValid &&
                    _educationisValid &&
                    _transportisValid &&
                    _othersisValid)
                  {
                    print(
                        'value:${_food.text} ${_entertainment.text} ${_bill.text} ${_grocery.text} ${_education.text} ${_transport.text} ${_others.text}'),
                     exp= Expenses.ofString(
                      food: _food.text,
                      entertainment: _entertainment.text,
                      bills: _bill.text,
                      grocery: _grocery.text,
                      education: _education.text,
                      transport: _transport.text,
                      others: _others.text,
                    ),
                    //exp.writeToDatabase(Name: 'test1', time: DateTime.now()),
                    await Firebase.initializeApp(),
                    snapshot=await  FirebaseFirestore.instance.collection('test1').doc('2022-01-20 22:21:54.187601').get(),
                    print(snapshot.data()),
                  }
                //picked= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime(2100)),
                //print(picked.toString()),
              },
              child: const Text('Print'),
            ),
          ),
        ],
      ),
    );
  }
}
