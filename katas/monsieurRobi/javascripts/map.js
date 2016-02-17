var events = [
  { "host": 'Dominique', "when":"02/04/2016", where: 'Paris', "latitude": 48.82615, "longitude": 2.34091},
  { "host": 'Karine', "when":"30/04/2016", where: "Bergerac", "latitude": 44.85198, longitude: "0.48826"},
  { "host": 'Karina', "when": "14/05/2016", where: 'Montreuil, 93', "latitude": 48.8623357, "longitude": 2.4412184 },
  { "host": 'Tyfen', "when": "21/05/2016", where: 'Lucey, Savoie', "latitude": 45.7516, "longitude":5.78737},
  { "host": 'Julie', "when": "28/05/2016", where: 'Avignon', "latitude": 43.94172, "longitude":4.83339},
  { "host": 'Vincent', "when": "04/06/2016", where: 'Limours, 91', "latitude": 48.6455882, "longitude": 2.075826 },
{ "host": 'Corinne', "when": "11/06/2016", where: 'Diois', "latitude": 44.68101845,"longitude":5.47397281258444},
  { "host": 'Rachel', "when": "25/06/2016", where: 'Nancy', "latitude": 48.68807,"longitude":6.17346},
  { "host": 'Les Sidebottom', "when": "02/07/2016", where: 'Warrington, England', "latitude": 53.40170, "longitude":-2.56155},
  { "host": 'Nathalie', "when":"09/07/2016", where: "Paris", "latitude": 48.88481, "longitude": 2.30284},
  { "host": 'Gaelle', "when": "05/06/2016", where: 'Lagny sur Marne, 77', "latitude": 48.8735584, "longitude": 2.7121663 },

];
var accessToken = "pk.eyJ1Ijoia3JpY2h0b2YiLCJhIjoiYjU1MTg4MWU5ZDRkNWVkOGRlZjUzZWFjNWYyMWI5YzcifQ.57puNCxCdXweviIgoWBG4Q";
var origin = [49.603354,-5.8883335];
var initialZoom = 6;

var map = L.map('map', {
  center: origin,
  zoom: initialZoom,
  touchZoom: false,
  scrollWheelZoom: false
});
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>, made with love (not too much) by <a href="http://christophe.robillard.pro">Christophe Robillard</a>',
    maxZoom: 18,
    id: 'krichtof.4dbe142b',
    accessToken: accessToken
}).addTo(map);

for (var i in events) {
  event = events[i];
  L.marker([event.latitude, event.longitude]).addTo(map)
    .bindPopup(event.when + ': chez ' + event.host + '<br>' + event.where);
}

var info = L.control({position: 'topleft'});
info.onAdd = function(map) {
  this._div = L.DomUtil.create('div', 'info');
  this._div.innerHTML = '<h1>La tournée dans vos salons</h1>';
  this._div.innerHTML += "<p>Alors, evidemment, la question que tout le monde se pose en regardant cette carte, c'est à quand Monsieur Robi dans votre salon ?</p>"
  return this._div;
};

info.addTo(map);
