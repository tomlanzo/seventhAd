  const updateCountdown = (startingAt) => {
    const now = new Date().getTime() / 1000;
    const diff = startingAt - now;
    let seconds = parseInt(diff, 10);
    let days = Math.floor(seconds / (3600*24));
    seconds  -= days*3600*24;
    let hrs   = Math.floor(seconds / 3600);
    seconds  -= hrs*3600;
    let mnts = Math.floor(seconds / 60);
    seconds  -= mnts*60;

    if (diff >= 0) {
      let label;

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


  const countdown = document.getElementById("countdown");

  if (countdown) {
    const startingAt = parseInt(countdown.dataset.startingAt);

    const updateCountdownId = setInterval(() => {
      const status = updateCountdown(startingAt);

      if (status.shouldStop) {
        console.log('Seance started, stop countdown');
        clearInterval(updateCountdownId);
        const nextPagePath = (countdown.dataset.nextPagePath);
        window.location.replace(nextPagePath);
        // redirect(redirectPath);
      }
    }, 1000);
  }
