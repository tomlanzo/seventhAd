  function updateCountdown(startingAt) {
    var now = new Date().getTime() / 1000;
    var diff = startingAt - now;
    var seconds = parseInt(diff, 10);
    var days = Math.floor(seconds / (3600*24));
    seconds  -= days*3600*24;
    var hrs   = Math.floor(seconds / 3600);
    seconds  -= hrs*3600;
    var mnts = Math.floor(seconds / 60);
    seconds  -= mnts*60;

    if (diff >= 0) {
      var label;

      if (diff < 60) {
        label = "<div class='box-counter-container'><div class='box-counter'><div class='unit_2'>"+ seconds+"</div><label>s</label>" + "</div></div>";
      } else if (diff < 3600) {
        label = "<div class='box-counter-container'><div class='box-counter'><div class='unit_2'>" + mnts+"</div> <label>min</label> </div><div class='box-counter'><div class='unit_2'>"+seconds+"</div><label>s</label>" + "</div></div>";
      } else if (diff < 86400) {
        label = "<div class='box-counter-container'><div class='box-counter'><div class='unit_2'>" + hrs+"</div> <label>h</label> </div><div class='box-counter'><div class='unit_2'>"+mnts+" "+seconds+" s";
      } else {
        label = days+" d "+hrs+" h "+mnts+" min "+seconds+" s";
      }

      countdown.innerHTML = label;
    }

    if (diff <= 0) {
      return { shouldStop: true }; // on va vouloir clear l'intervalle
    }

    return { shouldStop: false };
  };


  var countdown = document.getElementById("countdown");

  if (countdown) {
    var startingAt = parseInt(countdown.dataset.startingAt);

    var updateCountdownId = setInterval(function() {
      var status = updateCountdown(startingAt);

      if (status.shouldStop) {
        console.log('Seance started, stop countdown');
        clearInterval(updateCountdownId);
        var nextPagePath = (countdown.dataset.nextPagePath);
        window.location.replace(nextPagePath);
        // redirect(redirectPath);
      }
    }, 1000);
  }
