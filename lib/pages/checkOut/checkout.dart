import 'package:flutter/material.dart';
import 'package:my_galf/components/colors.dart';
import 'package:my_galf/components/navbar.dart';

class checkoutPage extends StatefulWidget {
  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

class _checkoutPageState extends State<checkoutPage> {
  Map paymentMethod = {
    "upi": "upiPayment",
    "card": "cCardDcard",
    "net": "netBanking",
    "cod": "cod"
  };

  Object? paymentType;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentScreen = currentWidth <= 300
        ? "xsmall"
        : currentWidth > 300 && currentWidth < 600
            ? "small"
            : currentWidth >= 600 && currentWidth <= 1200
                ? "medium"
                : "big";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 115,
        flexibleSpace: Navbar(currentScreen: currentScreen),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey[400],
        child: content(currentWidth),
      ),
    );
  }

  Widget content(currentWidth) {
    return Container(
      child: Column(
        children: [
          Container(
            width: currentWidth / 1.2,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "HOME/CHECKOUT",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            width: currentWidth / 1.2,
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: currentWidth / 2,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "PinCode:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "723121"),
                              ]),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.ads_click_rounded,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "Auto Select Address",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        color: Colors.grey[200],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 430,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //mannage address heading
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mannage Address",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3))),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "Add Address",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )

                              //address

                              ,
                              Container(
                                height: 250,
                                width: 900,
                                // color: Colors.red,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 280,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 15,
                                                    width: 15,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(2),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      height: 7,
                                                      width: 7,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Kio Dow 10025",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                color: Colors.red,
                                                height: 140,
                                                width: 260,
                                                child: Text(
                                                  "123,RGV MUE Inspector Office,Kestopur,New Town",
                                                  softWrap: true,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 200,
                                          width: 260,
                                          // color:
                                          // Color.fromARGB(255, 21, 255, 0),
                                        ),
                                        Container(
                                          height: 200,
                                          width: 260,
                                          color:
                                              Color.fromARGB(255, 4, 95, 242),
                                        )
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 10),
                                height: 50,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 1))),
                                child: Row(
                                  children: const [
                                    Text(
                                      "Payment Method",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: const Text('UPI Redirect'),
                                      leading: Radio(
                                        value: "upi",
                                        groupValue: paymentMethod,
                                        onChanged: (Object? value) {
                                          setState(() {
                                            paymentType = value;
                                          });
                                        },
                                        // groupValue: _character,
                                        // onChanged: (? value) {
                                        //   setState(() {
                                        //     _character = value;
                                        //   });
                                        // },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Credit/Debit Card'),
                                      leading: Radio(
                                        value: "card",
                                        groupValue: paymentMethod,
                                        onChanged: (Object? value) {},
                                        // groupValue: _character,
                                        // onChanged: (? value) {
                                        //   setState(() {
                                        //     _character = value;
                                        //   });
                                        // },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('NetBanking'),
                                      leading: Radio(
                                        value: "netBank",
                                        groupValue: paymentMethod,
                                        onChanged: (Object? value) {},
                                        // groupValue: _character,
                                        // onChanged: (? value) {
                                        //   setState(() {
                                        //     _character = value;
                                        //   });
                                        // },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Cash On Delivery'),
                                      leading: Radio(
                                        value: "cod",
                                        groupValue: paymentMethod,
                                        onChanged: (Object? value) {},
                                        // groupValue: _character,
                                        // onChanged: (? value) {
                                        //   setState(() {
                                        //     _character = value;
                                        //   });
                                        // },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                ),

                //left section
                Container(
                  height: 90,
                  width: currentWidth / 3 - 30,
                  color: Colors.yellow,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
