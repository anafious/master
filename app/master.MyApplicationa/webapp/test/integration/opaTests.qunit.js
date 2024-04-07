sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'master/MyApplicationa/test/integration/FirstJourney',
		'master/MyApplicationa/test/integration/pages/PatientList',
		'master/MyApplicationa/test/integration/pages/PatientObjectPage'
    ],
    function(JourneyRunner, opaJourney, PatientList, PatientObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('master/MyApplicationa') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePatientList: PatientList,
					onThePatientObjectPage: PatientObjectPage
                }
            },
            opaJourney.run
        );
    }
);