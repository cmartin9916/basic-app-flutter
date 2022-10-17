import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_basic_app/providers/example_provider.dart';
import 'package:flutter_base_basic_app/services/repositories/models/example_model.dart';
import 'package:provider/provider.dart';

class ExampleAdminScreen extends StatelessWidget {
  const ExampleAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      // Obtener el selected menu opt
    final provider = Provider.of<ExampleProvider>(context);
    provider.listRecords();
    // Cambiar para mostrar la pagina respectiva
    final records = provider.records;

    final TextEditingController titleController = TextEditingController();
    final TextEditingController yearController = TextEditingController();

    void _showForm(int? id) async {
      if (id != null) {
        final existingJournal = records.firstWhere((element) => element.id == id);
        titleController.text = existingJournal.title;
        yearController.text = existingJournal.year.toString();
      }

      showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Titulo'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: yearController,
                decoration: const InputDecoration(hintText: 'Año'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new journal
                  if (id == null) {
                    await provider.save(
                      ExampleModel(title: titleController.text, year: int.parse(yearController.text))
                    );
                  } else {
                    await provider.update(
                      ExampleModel(id: id, title: titleController.text, year: int.parse(yearController.text))
                    );
                  }

                  // Clear the text fields
                  titleController.text = '';
                  yearController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Guardar' : 'Actualizar'),
              )
            ],
          ),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Example'),
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) => Card(
          color: Colors.orange[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
              title: Text("Id: ${records[index].id}, title: ${records[index].title}"),
              subtitle: Text(records[index].year.toString()),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(records[index].id),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        provider.delete(records[index].id);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Registro eliminado exitosamente!'),
                        ));
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}