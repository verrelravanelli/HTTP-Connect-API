import 'package:flutter/material.dart';
import 'package:flutter_application_1/apiservice.dart';
import 'package:flutter_application_1/userprofile.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  Service serviceAPI = Service();
  late Future<List<UserProfile>> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page GET"),
      ),
      body: Container(
        child: FutureBuilder<List<UserProfile>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserProfile> isiData = snapshot.data!;
              return ListView.builder(
                itemCount: isiData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].firstName!),
                      subtitle: Text(
                        isiData[index].lastName!,
                      ),
                      trailing: InkWell(
                        onTap: () {
                          serviceAPI.deleteData(isiData[index].id!);
                          setState(() {
                            data = serviceAPI.getAllData();
                          });
                        },
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
