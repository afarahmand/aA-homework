function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

// Let's test out various ways to call Dog.prototype.chase
Noodles.chase(Markov);
Dog.prototype.chase.call(Noodles, Markov)
Dog.prototype.chase.apply(Noodles, [Markov])