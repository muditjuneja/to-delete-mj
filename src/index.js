import message from './message';
import './index.scss';

// Give it something to render ...
const createDom = () => {
  const div = document.createElement('div');
  div.id = 'root';
  div.appendChild(message);
  // For access in unit test
  document.body.appendChild(div);
  return div;
};

createDom();

const multiply = (a, b) => a * b;

export { createDom, multiply };
