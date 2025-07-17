import { Given, When, And, Then, Before, After }from 'cypress-cucumber-preprocessor/steps';

Given('I visit the factorial calculator page', () => {
  cy.visit('/');
});

When('I enter {string} in the input field', (number) => {
  cy.enter(number);
});

And('I click the {string} button', (buttonText) => {
  cy.clickButton(buttonText);
});

Then('I should see the result {string} displayed', (expectedResult) => {
  cy.checkResult(expectedResult);
});

Then('I should see an error message {string}', (errorMessage) => {
  cy.checkErrorMessage(errorMessage);
});

When('I paste {string} into the input field', (number) => {
  cy.paste(number);
});

When('I navigate using TAB to focus on the {string}', (component) => {
  cy.navigateTo(component);
});

And('I should not see an error message {string}', (errorMessage) => {
  cy.notSee(errorMessage);
});

And('I click the {string} button {int} times', (buttonText, times) => {
  for (let i = 0; i < times; i++) {
    cy.clickButton(buttonText);
  }
});

And('I press the {string} key', (key) => {
  cy.pressKey(key);
});

When('I change the viewport to mobile', () => {
  cy.viewport('iphone-6');
});

When('I reload the page', () => {
  cy.reload();
});