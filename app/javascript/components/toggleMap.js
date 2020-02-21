
const toggleMapVisibility = () => {
  const button = document.querySelector('#map-btn');
  const map = document.querySelector('#map');
  console.log("heloe");
  console.log(button);
  console.log(map);
  if (button) {
    button.addEventListener('click', () => {
      map.classList.toggle('visible-map');
    });
  }
}

export { toggleMapVisibility };
