document.addEventListener('turbolinks:load', function(){
  var progress = document.querySelector('.progress-bar')
  if(progress) {
    progress.style.width = progress.dataset.progress + '%'
  }
})