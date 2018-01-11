// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// x is functionally scoped

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// const block scopes

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

// mysteryScoping2();
// mysteryScoping3();
// mysteryScoping4();
// mysteryScoping5();

// madlib

function madLib(verb, adjective, noun) {
  console.log("We shall " + verb.toUpperCase() + " the " + adjective.toUpperCase() + " " + noun.toUpperCase() + ".");
}

madLib('make', 'best', 'guac');

// substring

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

var searchS = "RedCloud";
var subS = "Cloud";

console.log(isSubstring(searchS, subS));

// fizzbuzz

function fizzbuzz(array) {
  var new_array = [];

  for (i in array) {
    console.log(array[i]);
    if ((array[i] % 5 === 0) && (array[i] % 3 === 0)) {}
    else if ((array[i]%5 === 0) || (array[i]%3 === 0)) {
      new_array.push(array[i]);
    }
  }

  return new_array;
}

var arr = [3, 5, 15];
console.log(fizzbuzz(arr));


function isPrime(number) {
  if (number < 2) {return false;}
  var j = 2;

  while (j < number) {
    if (number % j === 0) {
      return false;
    }
    j+=1;
  }

  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));


// sumOfNPrimes
function sumOfNPrimes(n) {
  var sum = 0;
  var i = 2;

  while (n > 0) {
    if (isPrime(i)) {
      sum+=i;
      n-=1;
    }
    i+=1;
  }

  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
