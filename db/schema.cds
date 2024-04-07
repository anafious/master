namespace incidentApp;

entity Patient {
  key ID: UUID;
  patientID: String(10) @assert.unique @mandatory;
  name: String(100);
  age: Integer;
  gender: String(10);
  address: String(200);
  prescriptions: Composition of many Prescription on prescriptions.patient = $self;
}

entity Medicine {
  key ID: UUID;
  medicineID: String(10) @assert.unique @mandatory;
  name: String(100);
  manufacturer: String(100);
  description: String(500);
  prescriptions: Association to many Prescription on prescriptions.medicine = $self;
}

entity Prescription {
  key ID: UUID;
  prescriptionID: String(10) @assert.unique @mandatory;
  date: Date;
  quantity: Integer;
  instructions: String(500);
  patient: Association to Patient;
  medicine: Association to Medicine;
}

