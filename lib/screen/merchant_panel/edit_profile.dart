import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nrb_express/utill/color_resources.dart';
import 'package:nrb_express/utill/dimensions.dart';
import 'package:nrb_express/utill/styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? _region;
  String? _accountType;
  String? _paymentMethod;

  final _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _addressController = TextEditingController();
  final _addressNumberController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _bankAccountController = TextEditingController();
  final _bkashController = TextEditingController();

  String? DivisionChoose;
  String? SelectAreaChoice;
  String? ContryChoice;

  List DivisionItem = [
    "Dhaka",
    "Chittagong",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh",
  ];

  List selectArea = [
    'Feni',
    'Dhaka',
    'Rashahi',
  ];

  List Country = [
    'Bangladesh',
    'India',
    'Pakistan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text(
          "EDIT PROFILE",
          style: LatoBold.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: ColorResources.WHITE),
        ),
        backgroundColor: ColorResources.COLOR_PRIMARY,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "GENERAL INFORMATION",
                style: LatoBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: ColorResources.BLACK),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    //--------------------Radio button region----
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "Region:",
                            style: LatoMedium.copyWith(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: ColorResources.HINT_TEXT_COLOR),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Local",
                                groupValue: _region,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    _region = variable!;
                                  });
                                },
                              ),
                              const Text("Local"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "International",
                                groupValue: _region,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    _region = variable!;
                                  });
                                },
                              ),
                              const Text("International"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //--------------------Radio button Account Type----

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Account Type:",
                              style: LatoMedium.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: ColorResources.HINT_TEXT_COLOR),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "Retail",
                                    groupValue: _accountType,
                                    activeColor: ColorResources.COLOR_PRIMARY,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        _accountType = variable!;
                                      });
                                    },
                                  ),
                                  const Text("Retail"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Corporate",
                                    groupValue: _accountType,
                                    activeColor: ColorResources.COLOR_PRIMARY,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        _accountType = variable!;
                                      });
                                    },
                                  ),
                                  const Text("Corporate"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "Government",
                                    groupValue: _accountType,
                                    activeColor: ColorResources.COLOR_PRIMARY,
                                    onChanged: (String? variable) {
                                      setState(() {
                                        _accountType = variable!;
                                      });
                                    },
                                  ),
                                  const Text("Government"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //-----------------------TextFormField------
                    Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _nameController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z]')),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Enter name",
                            hintStyle: TextStyle(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: Colors.black),
                            filled: true,
                            fillColor: ColorResources.TEXTFIELD_COLOR,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'requerd';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-z0-9!@.]')),
                          ],
                          decoration: const InputDecoration(
                            hintText: "Enter email",
                            hintStyle: TextStyle(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: Colors.black),
                            filled: true,
                            fillColor: ColorResources.TEXTFIELD_COLOR,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your email';
                            } else if (!value.contains('@') ||
                                !value.contains('.')) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: "Enter phone",
                            hintStyle: TextStyle(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: Colors.black),
                            filled: true,
                            fillColor: ColorResources.TEXTFIELD_COLOR,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'requerd';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: ColorResources.BACKGROUND_COLOR),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _websiteController,
                            decoration: const InputDecoration(
                              hintText: "Enter website",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: Colors.black),
                              // filled: true,
                              //fillColor: ColorResources.TEXTFIELD_COLOR,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'requerd';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //-------------------------billing information
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "BILLING INFORMATION",
                style: LatoBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: ColorResources.BLACK),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1, color: ColorResources.BACKGROUND_COLOR),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _addressController,
                        decoration: const InputDecoration(
                          hintText: "Enter Address",
                          hintStyle: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'requerd';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: ColorResources.BACKGROUND_COLOR),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: DropdownButton(
                              hint: const Text(
                                "Select Division",
                                style: TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: Colors.black),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black26,
                              ),
                              iconSize: 30,
                              isExpanded: true,
                              underline: const SizedBox(),
                              style: const TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: Colors.black),
                              value: DivisionChoose,
                              onChanged: (value) {
                                setState(() {
                                  DivisionChoose = value as String?;
                                });
                              },
                              items: DivisionItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ColorResources.BACKGROUND_COLOR),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: DropdownButton(
                                hint: const Text("Select Area",
                                    style: TextStyle(
                                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                        color: Colors.black)),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black26,
                                ),
                                iconSize: 30,
                                isExpanded: true,
                                underline: const SizedBox(),
                                style: const TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: Colors.black),
                                value: SelectAreaChoice,
                                onChanged: (value) {
                                  setState(() {
                                    SelectAreaChoice = value as String?;
                                  });
                                },
                                items: selectArea.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: ColorResources.BACKGROUND_COLOR),
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _addressNumberController,
                            decoration: const InputDecoration(
                              hintText: "Enter number",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'requerd';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            color: ColorResources.TEXTFIELD_COLOR,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: DropdownButton(
                                hint: const Text(
                                  "Select Country",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black26,
                                ),
                                iconSize: 30,
                                isExpanded: true,
                                underline: const SizedBox(),
                                style: const TextStyle(
                                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    color: Colors.black),
                                value: ContryChoice,
                                onChanged: (value) {
                                  setState(() {
                                    ContryChoice = value as String?;
                                  });
                                },
                                items: Country.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1, color: ColorResources.BACKGROUND_COLOR),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-z0-9!@.]')),
                        ],
                        decoration: const InputDecoration(
                          hintText: "Enter email",
                          hintStyle: TextStyle(
                              fontSize: Dimensions.FONT_SIZE_DEFAULT,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          } else if (!value.contains('@') ||
                              !value.contains('.')) {
                            return 'Invalid Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),

            //--------------------Payment information--------
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "PAYMENT INFORMATION",
                style: LatoBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                    color: ColorResources.BLACK),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "Payment Method:",
                            style: LatoMedium.copyWith(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                color: ColorResources.HINT_TEXT_COLOR),
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Bank",
                                groupValue: _paymentMethod,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    _paymentMethod = variable!;
                                  });
                                },
                              ),
                              const Text("Bank"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Bkash",
                                groupValue: _paymentMethod,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    _paymentMethod = variable!;
                                  });
                                },
                              ),
                              const Text("Bkash"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "Cash",
                                groupValue: _paymentMethod,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (String? variable) {
                                  setState(() {
                                    _paymentMethod = variable!;
                                  });
                                },
                              ),
                              const Text("Cash"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _bankNameController,
                      decoration: const InputDecoration(
                        hintText: "Bank name",
                        hintStyle: TextStyle(
                            fontSize: Dimensions.FONT_SIZE_DEFAULT,
                            color: Colors.black),
                        filled: true,
                        fillColor: ColorResources.TEXTFIELD_COLOR,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'requerd';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _bankAccountController,
                            decoration: const InputDecoration(
                              hintText: "Bank acc.No.",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: Colors.black),
                              filled: true,
                              fillColor: ColorResources.TEXTFIELD_COLOR,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'requerd';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _bkashController,
                            decoration: const InputDecoration(
                              hintText: "Bkash number",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                  color: Colors.black),
                              filled: true,
                              fillColor: ColorResources.TEXTFIELD_COLOR,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'requerd';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          color: ColorResources.COLOR_PRIMARY,
                          child: Text(
                            "UPDATE INFORMATION",
                            style: LatoBold.copyWith(
                                fontSize: Dimensions.FONT_SIZE_LARGE,
                                color: ColorResources.WHITE),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
