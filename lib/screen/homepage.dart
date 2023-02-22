import 'package:flutter/material.dart';
import 'package:weather/screen/searchcity.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ?x;
  Future? getdata() async{

    Future.delayed(
     await Duration(seconds: 3),
      () => print((x!+1)),
    );

  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchCity())),
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                )
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "there is no weather  😔	",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "searching now   🔍",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: 'Dialog Title',
                      desc: 'Dialog description here.............',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show(),
                    child: Text("AwesomeDialog"),
                  ),
                  Container(
                    width: 350,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: ["Brazil", "Tunisia", 'Canada'],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Menu mode",
                          hintText: "country in menu mode",
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Brazil",
                    ),
                  ),
                  DropdownSearch<String>.multiSelection(
                    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    popupProps: PopupPropsMultiSelection.menu(
                      showSelectedItems: true,
                      disabledItemFn: (String s) => s.startsWith('I'),
                    ),
                    onChanged: print,
                    selectedItems: ["Brazil"],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
