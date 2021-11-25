// More infor here: https://testing-library.com/docs/dom-testing-library/example-intro
import { getByTestId, queryByTestId, waitFor } from '@testing-library/dom';
import '@testing-library/jest-dom';

import { createDom, multiply } from '../index.js';

test('Message is rendering correctly', async () => {
  const message = 'Hello, from the Javascript Template!';
  const dom = createDom();

  // Wait for it to render
  await waitFor(() => expect(queryByTestId(dom, 'message')).toBeTruthy());

  // Check the content matches
  expect(getByTestId(dom, 'message')).toHaveTextContent(message);
});

test('Multiply is multiplying correctly', () => {
  expect(multiply(4, 7)).toBe(28);
});
