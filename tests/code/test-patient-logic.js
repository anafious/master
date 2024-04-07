/**
 * Given a running CAP service, the unit test should be able to get passed.
 *
 * @param {Function} GET - The `axios` function to send a GET request
 * @param {Function} POST - The `axios` function to send a POST request
 * @param {Function} PATCH - The `axios` function to send a PATCH request
 * @param {Function} DELETE - The `axios` function to send a DELETE request
 * @param {Function} expect - The `chai` function to assert the response
 */
module.exports = async function(GET, POST, PATCH, DELETE, expect) {
  // Create a new draft for Patient
  let response = await POST('/service/incidentApp/Patient', {
    patientID: 'P001',
    name: 'John Doe',
    age: 17,
    gender: 'Male',
    address: '123 Main St'
  });
  expect(response.status).to.be.oneOf([200, 201]);

  // Try to activate the draft
  try {
    response = await POST(`/service/incidentApp/Patient(ID=${response.data.ID},IsActiveEntity=false)/incidentAppSrv.draftActivate`);
  } catch (error) {
    expect(error.response.status).to.equal(400);
    expect(error.response.data.error.message).to.equal('Patients younger than 18 are not accepted');
  }

  // Update the draft
  response = await PATCH(`/service/incidentApp/Patient(ID=${response.data.ID},IsActiveEntity=false)`, {
    age: 18
  });
  expect(response.status).to.be.oneOf([200, 204]);

  // Activate the draft
  response = await POST(`/service/incidentApp/Patient(ID=${response.data.ID},IsActiveEntity=false)/incidentAppSrv.draftActivate`);
  expect(response.status).to.be.oneOf([200, 201]);
};