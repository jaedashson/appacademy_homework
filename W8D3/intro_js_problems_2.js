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