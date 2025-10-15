import 'package:flutter/material.dart';

class AddBuildingIssuesScreen extends StatefulWidget {
  const AddBuildingIssuesScreen({super.key});

  @override
  State<AddBuildingIssuesScreen> createState() => _AddBuildingIssuesScreenState();
}

class _AddBuildingIssuesScreenState extends State<AddBuildingIssuesScreen> {
  // --- State Variables for Dropdowns ---
  String? selectedBuilding;
  String? selectedDamageType;
  
  // Controllers for input fields
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _floorsController = TextEditingController();
  final TextEditingController _classroomsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // --- Dropdown List Values ---
  static final List<String> buildingTypes = [ 
    'Academic Classroom', 'Office', 'Science Lab', 'Technology Lab', 
    'Library', 'Hostel', 'Computer Lab', 'Mahindodaya Lab', 
    'Stadium', 'Auditorium', 'Main Hall', 'Changing Room', 
    'Security Room', 'Wash Room', 'Boundary Wall',
  ];

  static final List<String> damageTypes = [ 
    'Foundation & Wall Damage', 
    'Roofing Damage', 
    'Utility Damage (electricity/water)',
    'Floor Damage', 
    'Drainage / Plumbing Structural Issue', 
    'Windows / Doors Frame Damage', 
    'Staircase & Corridor Damage',
  ];

  // --- Color Palette ---
  static const Color cardBackgroundColor = Color(0xFFFFFFFF); 
  static const Color primaryBlue = Color(0xFF53BDFF); // Save button and Back Icon color
  static const Color darkTextColor = Color(0xFF2C3E50); // Black/Dark Grey Color for text and icons
  static const Color greyTextColor = Colors.grey; 
  static const Color lightGreyFill = Color(0xFFF5F5F5); 

  // ----------------------------------------------------------------------
  // --- Date Picker Function ---
  // ----------------------------------------------------------------------
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryBlue, 
              onPrimary: cardBackgroundColor, 
              onSurface: darkTextColor, 
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  // --- Reusable Input Field Widget (Date Icon Color Changed to Dark) ---
  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    int maxLines = 1,
    bool isDate = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: maxLines > 1 ? null : 50,
          decoration: BoxDecoration(
            color: lightGreyFill, 
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent), 
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: isDate,
            onTap: isDate ? () => _selectDate(context) : null,
            style: const TextStyle(color: darkTextColor),
            keyboardType: (label.contains('Number') || label.contains('Floor')) ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: greyTextColor, fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: maxLines > 1 ? 12 : 0),
              border: InputBorder.none,
              // Date Icon color changed to darkTextColor
              suffixIcon: isDate ? const Icon(Icons.calendar_today, color: darkTextColor, size: 20) : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
  
  // --- Reusable Dropdown Field Widget (Icon Color is Dark) ---
  Widget _buildDropdownField({
    required String label,
    required String hintText,
    required List<String> items,
    required String? currentValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: lightGreyFill,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent),
          ),
          child: DropdownButtonFormField<String>(
            value: currentValue, 
            hint: Text(hintText, style: const TextStyle(color: greyTextColor, fontSize: 14)),
            isExpanded: true,
            // Icon color is darkTextColor
            icon: const Icon(Icons.keyboard_arrow_down, color: darkTextColor, size: 20), 
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(color: darkTextColor, fontSize: 14),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, overflow: TextOverflow.ellipsis),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // --- Upload Button Widget (Icon Color is Dark) ---
  Widget _buildUploadButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Images(JPG/PNG)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector( 
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image Upload functionality placeholder.')),
            );
          }, 
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGreyFill, 
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300, 
                width: 1, 
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Icon color is darkTextColor
                Icon(Icons.cloud_upload_outlined, color: darkTextColor, size: 35),
                SizedBox(height: 4),
                Text(
                  'Upload Buliding Damage Photoes',
                  style: TextStyle(color: greyTextColor, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardBackgroundColor, 

      appBar: AppBar(
        backgroundColor: cardBackgroundColor, 
        elevation: 0,
        // Reduced titleSpacing to give more horizontal room to the title
        titleSpacing: 8, 
        
        // --- BACK ICON FIX: Color changed to primaryBlue ---
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: primaryBlue, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        
        // --- TITLE FIX: Padding adjusted for better fit ---
        title: const Text(
            'Add your school building Issues', 
            style: TextStyle(
              color: darkTextColor, 
              fontWeight: FontWeight.bold, 
              fontSize: 18,
            ),
            // Ensure the title fits without wrapping too much
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
          ),
        
        actions: [
          Padding(
            // Reduced right padding slightly
            padding: const EdgeInsets.only(right: 12.0), 
            child: OutlinedButton(
              onPressed: () {
                // Save logic goes here
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: cardBackgroundColor, 
                foregroundColor: primaryBlue, 
                side: const BorderSide(color: primaryBlue, width: 1.5), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Form Fields ---
            _buildInputField(label: 'School Name', hintText: 'Enter Your School name', controller: _schoolNameController),
            
            _buildDropdownField(
              label: 'Select Damage Building', 
              hintText: 'select Type of Damage Building',
              items: buildingTypes, 
              currentValue: selectedBuilding,
              onChanged: (newValue) { setState(() { selectedBuilding = newValue; }); },
            ),

            _buildInputField(label: 'Number of Floors', hintText: 'Enter number of floors in building', controller: _floorsController),
            _buildInputField(label: 'Number of Classrooms', hintText: 'Enter Number of rooms in building', controller: _classroomsController),

            _buildDropdownField(
              label: 'Type Of Damage', 
              hintText: 'select Type of Damage',
              items: damageTypes, 
              currentValue: selectedDamageType,
              onChanged: (newValue) { setState(() { selectedDamageType = newValue; }); },
            ),

            _buildInputField(label: 'Description of Issue', hintText: 'Describe your School building Issue', maxLines: 5, controller: _descriptionController),

            _buildUploadButton(), 

            _buildInputField(label: 'Date Of Damage Occurrance', hintText: 'Enter Date of Damage Occurrance', isDate: true, controller: _dateController),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}