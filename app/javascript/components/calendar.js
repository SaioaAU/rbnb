import flatpickr from 'flatpickr';

const myCalendar = () => {
  const inputDates = document.querySelectorAll(".date_input input");
  console.log(inputDates);
  inputDates.forEach(input => {
    flatpickr(input, {
    minDate: 'today',
    dateFormat: 'Y-m-d'
    })
  });
}

export { myCalendar };

// const toggleDateInputs = function() {
//   const startDateInput = document.getElementById('booking_start_date');
//   const endDateInput = document.getElementById('booking_end_date');

//   if (startDateInput && endDateInput) {
//     const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

//     flatpickr(startDateInput, {
//     minDate: 'today',
//     dateFormat: 'd-m-Y',
//     disable: unvailableDates,
//     onChange: function(selectedDates, selectedDate) {
//       if (selectedDate === '') {
//         endDateInput.disabled = true;
//       }
//       let minDate = selectedDates[0];
//       minDate.setDate(minDate.getDate() + 1);
//       endDateCalendar.set('minDate', minDate);
//       endDateInput.disabled = false;
//     }
//   });
//     const endDateCalendar =
//       flatpickr(endDateInput, {
//         dateFormat: 'd-m-Y',
//         disable: unvailableDates,
//         },
//       });
//   }
// };

