// const readline = require('readline');
//
// const reader = readline.createInterface({
//   // it's okay if this part is magic; it just says that we want to
//   // 1. output the prompt to the standard output (console)
//   // 2. read input from the standard input (again, console)
//
//   input: process.stdin,
//   output: process.stdout
// });
//
// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
//   reader.close();
// });
//
// console.log("Last program line");


//Tea & Biscuits
const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

reader.question("Would you like some tea?", function (firstAns) {
  console.log(`So you ${firstAns} want tea`);

  reader.question("Would you like some biscuits?", function (secondAns) {
    console.log('and you ${secondAns} want biscuits.');
    reader.close();
  });
});

console.log("Last program line");
