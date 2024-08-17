import { LightningElement } from 'lwc';
export default class Map extends LightningElement {
    mapMarkers = [
        {
            location: {
                Latitude: '12.8234083',
                Longitude: '80.2177144',
            },

            title: 'Avengers Sports',
            description:
                'The best club present here.',
        },
    ];
    zoomLevel = 15;
    listView = 'visible';
}