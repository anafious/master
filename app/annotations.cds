using { incidentApp } from '../srv/service.cds';

annotate incidentApp.Patient with @UI.HeaderInfo: { TypeName: 'Patient', TypeNamePlural: 'Patients', Title: { Value: patientID } };
annotate incidentApp.Patient with {
  ID @UI.Hidden @Common.Text: { $value: patientID, ![@UI.TextArrangement]: #TextOnly }
};
annotate incidentApp.Patient with @UI.Identification: [{ Value: patientID }];
annotate incidentApp.Patient with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate incidentApp.Patient with {
  patientID @title: 'ID';
  name @title: 'Name';
  age @title: 'Age';
  gender @title: 'Gender';
  address @title: 'Address'
};

annotate incidentApp.Patient with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: patientID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: gender },
    { $Type: 'UI.DataField', Value: address }
];

annotate incidentApp.Patient with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: patientID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: age },
    { $Type: 'UI.DataField', Value: gender },
    { $Type: 'UI.DataField', Value: address }
  ]
};

annotate incidentApp.Patient with {
  prescriptions @Common.Label: 'Prescriptions'
};

annotate incidentApp.Patient with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate incidentApp.Patient with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Prescription', Target : 'prescriptions/@UI.LineItem' }
];

annotate incidentApp.Patient with @UI.SelectionFields: [
  patientID
];

annotate incidentApp.Medicine with @UI.HeaderInfo: { TypeName: 'Medicine', TypeNamePlural: 'Medicines', Title: { Value: medicineID } };
annotate incidentApp.Medicine with {
  ID @UI.Hidden @Common.Text: { $value: medicineID, ![@UI.TextArrangement]: #TextOnly }
};
annotate incidentApp.Medicine with @UI.Identification: [{ Value: medicineID }];
annotate incidentApp.Medicine with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate incidentApp.Medicine with {
  medicineID @title: 'ID';
  name @title: 'Name';
  manufacturer @title: 'Manufacturer';
  description @title: 'Description'
};

annotate incidentApp.Medicine with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: medicineID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: manufacturer },
    { $Type: 'UI.DataField', Value: description }
];

annotate incidentApp.Medicine with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: medicineID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: manufacturer },
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate incidentApp.Medicine with {
  prescriptions @Common.Label: 'Prescriptions'
};

annotate incidentApp.Medicine with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' }
];

annotate incidentApp.Medicine with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate incidentApp.Medicine with @UI.SelectionFields: [
  medicineID
];

annotate incidentApp.Prescription with @UI.HeaderInfo: { TypeName: 'Prescription', TypeNamePlural: 'Prescriptions', Title: { Value: prescriptionID } };
annotate incidentApp.Prescription with {
  ID @UI.Hidden @Common.Text: { $value: prescriptionID, ![@UI.TextArrangement]: #TextOnly }
};
annotate incidentApp.Prescription with @UI.Identification: [{ Value: prescriptionID }];
annotate incidentApp.Prescription with {
  patient @Common.ValueList: {
    CollectionPath: 'Patient',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: patient_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'patientID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'age'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'gender'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'address'
      },
    ],
  }
};
annotate incidentApp.Prescription with {
  medicine @Common.ValueList: {
    CollectionPath: 'Medicine',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: medicine_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'medicineID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'manufacturer'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate incidentApp.Prescription with @UI.DataPoint #date: {
  Value: date,
  Title: 'Date',
};
annotate incidentApp.Prescription with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate incidentApp.Prescription with {
  prescriptionID @title: 'ID';
  date @title: 'Date';
  quantity @title: 'Quantity';
  instructions @title: 'Instructions'
};

annotate incidentApp.Prescription with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: prescriptionID },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: instructions },
    { $Type: 'UI.DataField', Label: 'Medicine', Value: medicine_ID }
];

annotate incidentApp.Prescription with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: prescriptionID },
    { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: instructions },
    { $Type: 'UI.DataField', Label: 'Medicine', Value: medicine_ID }
  ]
};

annotate incidentApp.Prescription with {
  patient @Common.Text: { $value: patient.patientID, ![@UI.TextArrangement]: #TextOnly };
  medicine @Common.Text: { $value: medicine.medicineID, ![@UI.TextArrangement]: #TextOnly }
};

annotate incidentApp.Prescription with {
  patient @Common.Label: 'Patient';
  medicine @Common.Label: 'Medicine'
};

annotate incidentApp.Prescription with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#date' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' }
];

annotate incidentApp.Prescription with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate incidentApp.Prescription with @UI.SelectionFields: [
  patient_ID,
  medicine_ID
];

