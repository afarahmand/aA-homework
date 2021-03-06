const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);

  switch(action.type) {
    case 'SWITCH_CURRENCY':
      return [action.baseCurrency, action.rates];
    default:
      return state;
  }
  // return state; // remove this and fill out the body of the reducer function
};

export default reducer;
