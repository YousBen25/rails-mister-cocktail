import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerText = document.querySelector('.white-p')
  if (bannerText) {
  new Typed('.white-p', {
    strings: ["", "Change  your life and learn how to create the best cocktails"],
    typeSpeed: 50,
    backSpeed: 50,
  });
  }
}

export { loadDynamicBannerText };
