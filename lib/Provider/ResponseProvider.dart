import 'package:flutter/material.dart';
import '../Model/ResponseModel.dart';
import '../Service/ResponseService.dart';


class LeadProvider with ChangeNotifier {
  List<Lead> _leads = [];
  List<Lead> _filteredLeads = [];

  List<Lead> get leads => _filteredLeads;

  Future<void> fetchLeads() async {
    _leads = await LeadService().fetchLeads();
    notifyListeners();
  }

  void filterLeads(String query) {
    if (query.isEmpty) {
      _filteredLeads = [];
    } else {
      _filteredLeads = _leads
          .where((lead) =>
          '${lead.firstName} ${lead.lastName}'.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}


