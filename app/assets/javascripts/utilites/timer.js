
document.addEventListener('turbolinks:load', function(){
  var timer_wrap = document.getElementById('timer')
  
  if(timer_wrap) {
    coundown(timer, timer_wrap)
    
    function coundown(timer, wrap) {
      var countDownDate = new Date(timer*1000).getTime();
      var x = setInterval(function() {
        var now = new Date().getTime();
        var distance = countDownDate - now;
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        minutes = (minutes < 10) ? '0' + minutes : minutes
        seconds = (seconds < 10) ? '0' + seconds : seconds;
        wrap.innerText = minutes + ' : ' + seconds;
        if (distance < 0) {
         
          timer_wrap.innerText = '00 : 00';
          document.querySelector('form').submit()
          clearInterval(x)
        }
      }, 1000);
    }
  }
})

