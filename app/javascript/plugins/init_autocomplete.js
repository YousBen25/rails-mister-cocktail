import places from 'places.js'

const initAutocomplete = () => {
  const addressInputSearch = document.getElementById("cocktail-address-home");

  if (addressInputSearch ) {
    places({ container: addressInputSearch  });
  }
};


export { initAutocomplete };
