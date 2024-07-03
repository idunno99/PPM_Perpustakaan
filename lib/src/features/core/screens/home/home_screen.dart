import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perpustakaan/src/constants/colors.dart';
import 'package:perpustakaan/src/features/core/models/model_book.dart';
import 'package:perpustakaan/src/repository/book_api/api_bok_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];
  ApiBokRepository apiBokRepository = ApiBokRepository();

  getData() async {
    books = await apiBokRepository.getBooks();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 50),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(Radius.circular(20)),
            //       border: Border.all(width: 4, color: tPrimaryColor)),
            //   child: const Row(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(right: 5),
            //         child: FaIcon(
            //           FontAwesomeIcons.magnifyingGlass,
            //           color: tPrimaryColor,
            //           size: 25,
            //         ),
            //       ),
            //       Text(
            //         "Search...",
            //         style: TextStyle(
            //           color: Colors.grey,
            //           fontFamily: 'Poppins',
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // controller: controller.fullname,
                decoration: const InputDecoration(
                  focusColor: Color(0xff597445),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: tPrimaryColor, width: 4.0),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: tPrimaryColor,
                    ),
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: tPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Popular Books
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Books",
                    style: TextStyle(
                      color: tPrimaryColor,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text((books[index].title),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: books.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //   children: [
                //     SizedBox(
                //       child: Row(
                //         children: [
                //           Container(
                //             width: 115,
                //             height: 220,
                //             decoration: const BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 image: DecorationImage(
                //                     alignment: Alignment.topCenter,
                //                     image:
                //                         AssetImage("assets/images/Cover.png"))),
                //             child: Container(
                //               alignment: Alignment.bottomCenter,
                //               child: const Text("Cape Itu Wajar",
                //                   textAlign: TextAlign.left,
                //                   style: TextStyle(
                //                       color: tPrimaryColor,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 15)),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     SizedBox(
                //       child: Row(
                //         children: [
                //           Container(
                //             width: 115,
                //             height: 220,
                //             decoration: const BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 image: DecorationImage(
                //                     alignment: Alignment.topCenter,
                //                     image:
                //                         AssetImage("assets/images/Cover.png"))),
                //             child: Container(
                //               alignment: Alignment.bottomCenter,
                //               child: const Text("Cape Itu Wajar",
                //                   textAlign: TextAlign.left,
                //                   style: TextStyle(
                //                       color: tPrimaryColor,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 15)),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     SizedBox(
                //       child: Row(
                //         children: [
                //           Container(
                //             width: 115,
                //             height: 220,
                //             decoration: const BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 image: DecorationImage(
                //                     alignment: Alignment.topCenter,
                //                     image:
                //                         AssetImage("assets/images/Cover.png"))),
                //             child: Container(
                //               alignment: Alignment.bottomCenter,
                //               child: const Text("Cape Itu Wajar",
                //                   textAlign: TextAlign.left,
                //                   style: TextStyle(
                //                       color: tPrimaryColor,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 15)),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     SizedBox(
                //       child: Row(
                //         children: [
                //           Container(
                //             width: 115,
                //             height: 220,
                //             decoration: const BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 image: DecorationImage(
                //                     alignment: Alignment.topCenter,
                //                     image:
                //                         AssetImage("assets/images/Cover.png"))),
                //             child: Container(
                //               alignment: Alignment.bottomCenter,
                //               child: const Text("Cape Itu Wajar",
                //                   textAlign: TextAlign.left,
                //                   style: TextStyle(
                //                       color: tPrimaryColor,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 15)),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     SizedBox(
                //       child: Row(
                //         children: [
                //           Container(
                //             width: 115,
                //             height: 220,
                //             decoration: const BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)),
                //                 image: DecorationImage(
                //                     alignment: Alignment.topCenter,
                //                     image:
                //                         AssetImage("assets/images/Cover.png"))),
                //             child: Container(
                //               alignment: Alignment.bottomCenter,
                //               child: const Text("Cape Itu Wajar",
                //                   textAlign: TextAlign.left,
                //                   style: TextStyle(
                //                       color: tPrimaryColor,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 15)),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended Books",
                    style: TextStyle(
                      color: tPrimaryColor,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Books",
                    style: TextStyle(
                      color: tPrimaryColor,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: tPrimaryColor,
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 115,
                          height: 220,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      AssetImage("assets/images/Cover.png"))),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text("Cape Itu Wajar",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tPrimaryColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15)),
                          ),
                        ),
                      ],
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
}

// // class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // return SingleChildScrollView(
//   child: Container(
//     padding: const EdgeInsets.all(20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Search
//         // Container(
//         //   margin: const EdgeInsets.symmetric(horizontal: 50),
//         //   padding: const EdgeInsets.all(10),
//         //   decoration: BoxDecoration(
//         //       borderRadius: const BorderRadius.all(Radius.circular(20)),
//         //       border: Border.all(width: 4, color: tPrimaryColor)),
//         //   child: const Row(
//         //     children: [
//         //       Padding(
//         //         padding: EdgeInsets.only(right: 5),
//         //         child: FaIcon(
//         //           FontAwesomeIcons.magnifyingGlass,
//         //           color: tPrimaryColor,
//         //           size: 25,
//         //         ),
//         //       ),
//         //       Text(
//         //         "Search...",
//         //         style: TextStyle(
//         //           color: Colors.grey,
//         //           fontFamily: 'Poppins',
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         // ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             // controller: controller.fullname,
//             decoration: const InputDecoration(
//               focusColor: Color(0xff597445),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 borderSide: BorderSide(color: tPrimaryColor, width: 4.0),
//               ),
//               prefixIcon: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 child: FaIcon(
//                   FontAwesomeIcons.magnifyingGlass,
//                   color: tPrimaryColor,
//                 ),
//               ),
//               hintText: "Search...",
//               hintStyle: TextStyle(color: Colors.grey),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: tPrimaryColor),
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         // Popular Books
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Popular Books",
//                 style: TextStyle(
//                   color: tPrimaryColor,
//                   fontFamily: "Poppins",
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "See All",
//                   style: TextStyle(
//                     color: tPrimaryColor,
//                     fontFamily: "Poppins",
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             children: [
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Recommended Books",
//                 style: TextStyle(
//                   color: tPrimaryColor,
//                   fontFamily: "Poppins",
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "See All",
//                   style: TextStyle(
//                     color: tPrimaryColor,
//                     fontFamily: "Poppins",
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             children: [
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "New Books",
//                 style: TextStyle(
//                   color: tPrimaryColor,
//                   fontFamily: "Poppins",
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: const Text(
//                   "See All",
//                   style: TextStyle(
//                     color: tPrimaryColor,
//                     fontFamily: "Poppins",
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             children: [
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 115,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(
//                               alignment: Alignment.topCenter,
//                               image:
//                                   AssetImage("assets/images/Cover.png"))),
//                       child: Container(
//                         alignment: Alignment.bottomCenter,
//                         child: const Text("Cape Itu Wajar",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: tPrimaryColor,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );
//   }
// }
