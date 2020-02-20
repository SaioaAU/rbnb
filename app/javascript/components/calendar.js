import flatpickr from 'flatpickr';

const myCalendar = () => {
  const inputDates = document.querySelectorAll(".date_input input");
  inputDates.forEach(anyinput => {
    console.log(anyinput);
    flatpickr(anyinput, {
      minDate: 'today',
      dateFormat: 'd M Y'
    });
  });
};

export { myCalendar };


