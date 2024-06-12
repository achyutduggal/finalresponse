import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/ResponseModel.dart';
import '../Provider/ResponseProvider.dart';

class LeadListScreen extends StatefulWidget {
  @override
  _LeadListScreenState createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<LeadProvider>(context, listen: false).fetchLeads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leads'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                Provider.of<LeadProvider>(context, listen: false).filterLeads(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search by name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Consumer<LeadProvider>(
              builder: (context, leadProvider, child) {
                if (leadProvider.leads.isEmpty) {
                  return Center(child: Text('No leads found.'));
                } else if (leadProvider.leads.isEmpty) {
                  return Center(child: Text('No leads match your search.'));
                } else {
                  return ListView.builder(
                    itemCount: leadProvider.leads.length,
                    itemBuilder: (context, index) {
                      Lead lead = leadProvider.leads[index];
                      return ListTile(
                        title: Text('${lead.firstName} ${lead.lastName}'),
                        subtitle: Text(lead.email),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}