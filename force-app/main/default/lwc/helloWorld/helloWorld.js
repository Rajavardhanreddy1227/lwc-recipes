import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  greeting1='Rajavardhan Reddy Marikanti'
  changeHandler(event) {
    this.greeting = event.target.value;
  }
  changeHandler1(event) {
    this.greeting1 = event.target.value;
  }
}