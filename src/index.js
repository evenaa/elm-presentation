require('./css/dimension.css');
require('./css/slideshow.css');
require('./css/font-awesome-4.7.0/css/font-awesome.min.css');

var logoPath = require('./logo.svg');
var Elm = require('./Main.elm');

var root = document.getElementById('root');

Elm.Main.embed(root);
