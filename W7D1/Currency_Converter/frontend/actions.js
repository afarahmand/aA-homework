export const selectCurrency = (baseCurrency, rates) => {
  let action = {
    'type': "SWITCH_CURRENCY",
    'baseCurrency': baseCurrency,
    'rates': rates
  };

  return action;
};
