import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// 1
// const addLoggingToDispatch = function (store) {
//   let strDisp = store.dispatch;
//   return function (action) {
//     console.log(store.getState());
//     console.log(action);
//     strDisp(action);
//     console.log(store.getState());
//   };
// };

const addLoggingToDispatch = function (store) {
  return function nextMiddleware (next) {
    return function (action) {
      let strDisp = store.dispatch;
      console.log(store.getState());
      console.log(action);
      strDisp(action);
      console.log(store.getState());
      next(action);
    };
  };
};

const applyMiddlewares = function (store, ...middlewares) {
  let dispatch = store.dispatch;
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };
