// shamelessly stolen from the wonderful https://gitlab.com/yo/markdown-to-html

var showdown  = require('showdown');
var fs = require('fs');
let filename = "sfs-class-catalog.md"
let pageTitle = process.argv[2] || ""

fs.readFile(__dirname + '/style.css', function (err, styleData) {
  fs.readFile(__dirname + '/' + filename, function (err, data) {
    if (err) {
      throw err; 
    }
    let text = data.toString();

    converter = new showdown.Converter({
      ghCompatibleHeaderId: true,
      simpleLineBreaks: true,
      ghMentions: true,
    });

    let preContent = `
    <html>
      <head>
        <title>` + pageTitle + `</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
      </head>
      <body>
        <div id='content'>
    `

    let postContent = `

        </div>
        <style type='text/css'>` + styleData + `</style>
      </body>
    </html>`;

    html = preContent + converter.makeHtml(text) + postContent

    converter.setFlavor('original');

    let filePath = __dirname + "/public/sfs-class-catalog.html";
    fs.writeFile(filePath, html, function(err) { 
      console.log("Done, saved to " + filePath);
    }); 
  });
});
