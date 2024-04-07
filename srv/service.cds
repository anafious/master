using { incidentApp as my } from '../db/schema.cds';

@path: '/service/incidentApp'
@requires: 'authenticated-user'
service incidentAppSrv {
  @odata.draft.enabled
  entity Patient as projection on my.Patient;
  @odata.draft.enabled
  entity Medicine as projection on my.Medicine;
}