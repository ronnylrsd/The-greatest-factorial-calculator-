const INPUT_FACTORIAL_FIELD = '#number';
const CALCULATE_FACTORIAL_BUTTON = '#getFactorial';
const RESULT_DIV = '#resultDiv';
const TITLE = '.col-md-6 > .margin-base-vertical';

Cypress.Commands.add('enter', (number) => {
  if (number === 'max') {
    number = Number.MAX_SAFE_INTEGER;
  } else if (number === 'min') {
    number = Number.MIN_SAFE_INTEGER;
  }
  cy.get(INPUT_FACTORIAL_FIELD).clear().type(number);
});

Cypress.Commands.add('clickButton', (buttonText) => {
    if (buttonText === 'Calculate!') {
        cy.get(CALCULATE_FACTORIAL_BUTTON).click();
    } else {
        throw new Error(`Button with text "${buttonText}" is not recognized.`);
    }
});

Cypress.Commands.add('checkResult', (expectedResult) => {
    cy.get(RESULT_DIV).should('contain.text', expectedResult);
});

Cypress.Commands.add('checkErrorMessage', (errorMessage) => {
    cy.get(RESULT_DIV).should('contain.text', errorMessage);
});

Cypress.Commands.add('paste', (number) => {
    cy.get(INPUT_FACTORIAL_FIELD).invoke('val', number).trigger('input');
});

Cypress.Commands.add('navigateTo', (component) => {
    if (component === 'input field') {
        cy.press(Cypress.Keyboard.Keys.TAB);
    } else if (component === 'Calculate! button') {
        cy.press(Cypress.Keyboard.Keys.TAB);
    } else {
        throw new Error(`Component "${component}" is not recognized.`);
    }
});

Cypress.Commands.add('notSee', (errorMessage) => {
    cy.get(RESULT_DIV).should('not.contain.text', errorMessage);
});

Cypress.Commands.add('pressKey', (key) => {
    if (key === 'ENTER') {
        cy.get(INPUT_FACTORIAL_FIELD).type('{enter}');
    } else {
        throw new Error(`Key "${key}" is not recognized.`);
    }
});
