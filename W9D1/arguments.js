// sum
// Write a sum function that takes any number of arguments:

// const sum = function() {
//     let args = Array.from(arguments);
//     let sum = args.reduce((acc, ele) => acc + ele);
//     return sum;
// }

const sum = function(...args) {
    let sum = args.reduce((acc, ele) => acc + ele);
    return sum;
}

// console.log(sum(1, 2, 3, 4)); //=== 10;
// console.log(sum(1, 2, 3, 4, 5)); //=== 15;
// Solve it first using the arguments keyword, then rewrite your solution to use the ... rest operator.


// bind returns a function with the context bound to it (the *this*)
// kitty = Cat.new();
// kitty.says.bind(doggo)('hi', 'person');
// => kitty.says.bind(doggo, 'hi')('person');

// Apply takes in Array as second argument
// Call takes in multiple arguments separated by Commas

// no fat arrow on assessment
// hint: spread and rest operators

// Function.prototype.myBind = function(context) { // bind-time
//     let newThis = this;
//     return function() { // call-time
//         newThis.apply(context)
//     };
// }

// Function.prototype.myBind = function() { // bind-time
//     let args = Array.from(arguments);
//     let newThis = this;
//     return function() { // call-time
//         let newArgs = Array.from(arguments);
//         args = args.concat(newArgs);
//         newThis.apply(args[0], args.slice(1))
//     };
// }

Function.prototype.myBind = function (...args) { // bind-time
    let newThis = this;
    return function (...newArgs) { // call-time
        args = args.concat(newArgs);
        newThis.apply(args[0], args.slice(1));
    };
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

//___________________________________

const curriedSum = function(numArgs) {
    let numbers = [];
    return _curriedSum = function(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return numbers.reduce((acc, ele) => acc + ele);
        } else {
            return _curriedSum;
        }
    }
}

// let f1 = curriedSum(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

//__________________________________



function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}
  
sumThree(4, 20, 6); // == 30

Function.prototype.curry = function(num) {
    let args = [];
    return returner = function() {
        if (args.length < num) {
            args.push(arguments[0]);
            if (args.length === num) {
                return args.reduce((acc, ele) => acc + ele)
            } else {
                return returner;
            }
        } //se 
        // if (args.length === num) {
        //     return args.reduce((acc, ele) => acc + ele);
        // }
    }
}

// arguments 1 element
// arguments[0]
  
// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);
  
// or more briefly:
sumThree.curry(3)(4)(20)(6); // == 30