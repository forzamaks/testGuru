document.addEventListener('turbolinks:load', function(){
  var passwordConfirmField = document.querySelector('.js-password-confirmation')
  
  if(passwordConfirmField) {
    passwordConfirmField.addEventListener('input', validationPassword)
  }
})

function successValid(field) {
  field.classList.add('is-valid')
  field.classList.remove('is-invalid')
}
function errorValid(field) {
  field.classList.add('is-invalid')
  field.classList.remove('is-valid')
}
function noneValidate(field) {
  field.classList.remove('is-valid')
  field.classList.remove('is-invalid')
}

function validationPassword() {
  var passwordField = document.querySelector('.js-password')
  if(this.value.length == 0) {
    noneValidate(passwordField)
    noneValidate(this)
    return
  }
  if(passwordField.value === this.value) {
    successValid(passwordField)
    successValid(this)
  } else {
    errorValid(passwordField)
    errorValid(this)
  }

}

