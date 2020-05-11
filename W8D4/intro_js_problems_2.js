// Phase I: Callbacks

function titleize(names, callback) {

  function titleizer(name) {
    return `Mx. ${name} Jingleheimer Schmidt`
  };

  let titleized = names.map(titleizer);

  callback(titleized);
};

function printCallback(arr) {
  arr.forEach(ele => console.log(ele));
};

titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined


// Phase II: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let trickIndex = Math.floor((Math.random() * this.tricks.length ));
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`)
};

// Phase III: Function Invocation

Elephant.prototype.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach((elephant) => Elephant.prototype.paradeHelper(elephant));

// Phase IV: Closures

function dinerBreakfast() {
  let order = ["naan and hummus"];

  function orderBreakfast(newFood) {
    if (newFood) {
      order.push(newFood);
      // return `I'd like ${order.join(" ")} please.`
    }

    return `I'd like ${order.join(" ")} please.`;
  };

  return orderBreakfast;
};

let myBreakfast = dinerBreakfast();
myBreakfast();
myBreakfast("falafel");
myBreakfast("shawarm");