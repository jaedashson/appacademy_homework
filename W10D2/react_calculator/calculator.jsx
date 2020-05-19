import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { num1 : "", num2 : "", result : 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  // your code here
  setNum1(event) {
    if (event.currentTarget.value === "") {    
      this.setState({ num1: 0 });
    } else {
      this.setState({ num1: parseInt(event.currentTarget.value) });
    }
  }

  setNum2(event) {
    if (event.currentTarget.value === "") {
      this.setState({ num2: 0 });
    } else {
      this.setState({ num2: parseInt(event.currentTarget.value) });
    }
  }

  add(event) {
    event.preventDefault();
    this.setState({ result: this.state.num1 + this.state.num2 });
  }

  subtract(event) {
    event.preventDefault();
    this.setState({ result: this.state.num1 - this.state.num2 });
  }

  multiply(event) {
    event.preventDefault();
    this.setState({ result: this.state.num1 * this.state.num2 });
  }

  divide(event) {
    event.preventDefault();
    this.setState({ result: this.state.num1 / this.state.num2 });
  }

  clear(event) {
    event.preventDefault();
    this.setState({ num1: 0, num2: 0, result: 0 })
  }

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <br />
        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>C</button>
      </div>
    );
  }
}

export default Calculator;