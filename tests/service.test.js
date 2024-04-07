const test_patient_logic = require('./code/test-patient-logic');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test patient-logic', async () => {
    await test_patient_logic(GET, POST, PATCH, DELETE, expect);
  });
});