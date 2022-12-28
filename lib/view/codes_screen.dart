import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';
import 'package:qrscanner/controller/codes_cubit.dart';

class CodesScreen extends StatelessWidget {
  const CodesScreen({Key? key}) : super(key: key);
  static const routeName = '/codes-screen';

  @override
  Widget build(BuildContext context) {
    final codeCubit = CodesCubit.get(context)..getCodes();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 70,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(3)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.deepOrange,
                              width: 2.3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(3)),
                      margin: EdgeInsets.only(top: 15, right: 20),
                      child: Icon(
                        Icons.skip_previous_outlined,
                        color: Colors.deepOrange,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Scanning Result',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 84),
                  child: Text(
                    'Proreader will Keep your last 10 days history to keep your all scared history please  purched our pro package ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffB9B9B9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: BlocBuilder<CodesCubit, CodesState>(
                    builder: (context, state) {
                      if (state is GetCodesLoadingState) {
                        return CircularProgressIndicator();
                      } else if (state is GetCodesErrorState) {
                        return Text('something went wrong');
                      } else {
                        final codesList = codeCubit.codes;
                        return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 61, vertical: 5),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 13),
                                decoration: BoxDecoration(
                                    color: Color(0xffF4F4F4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.deepOrange,
                                              width: 2.3,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.file_copy_outlined,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Expanded(
                                      child: Text(
                                        codesList[index].code,
                                        style: TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: codesList.length);
                      }
                    },
                  ),
                ),
                defaultButton(
                    onPressed: () {},
                    buttonTitle: 'Send',
                    color: Colors.deepOrange)
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
