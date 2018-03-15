const button = document.getElementById('form-submit-button');
const formInput = document.getElementById('deal_requester_address');

const submission = (e) => {
  if (formInput.value == "") {
    e.preventDefault();
    alert('please enter something');
  }
}

button.addEventListener('click', submission);

document.addEventListener("DOMContentLoaded", function(event) {
  formInput.value = "";
});
