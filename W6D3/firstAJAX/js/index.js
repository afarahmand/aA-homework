console.log("Hello from the JavaScript console!");

// Your AJAX request here
// $.ajax({
// 	url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=67a8eb8658b2669aa959b0cef5ef2a1a',
// 	type: 'GET',
// 	success: function (message) {
//     console.log(message);
//     console.log("!!!");
// 		console.log(message.body);
// 	},
//   error: function (message) {
//     console.log(message.length);
//     console.log("Failure!");
//   }
// });

$.ajax({
  type: 'GET',
  dataType: 'html',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success: function (data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error: function () {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
console.log("Hello from the JavaScript console!");
