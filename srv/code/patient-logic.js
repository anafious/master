/**
 * 
 * @Before(event = { "CREATE","UPDATE" }, entity = "incidentAppSrv.Patient")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(req) {
    if (req.data.age < 18) {
        req.error(400, 'Patients younger than 18 are not accepted');
    }
}