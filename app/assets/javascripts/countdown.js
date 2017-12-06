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
    if (days == 0 && hrs == 0 && mnts == 0) {
      const label = seconds+" s";
      countdown.innerText = label;
    } else if (days == 0 && hrs == 0) {
      const label = mnts+" min "+seconds+" s";
      countdown.innerText = label;
    } else if (days == 0) {
      const label = hrs+" h "+mnts+" min "+seconds+" s";
      countdown.innerText = label;
    } else {
      const label = days+" d "+hrs+" h "+mnts+" min "+seconds+" s";
      countdown.innerText = label;
    }
  }

  if (diff <= 0) {
    return { shouldStop: true }; // on va vouloir clear l'intervalle
  }

  return { shouldStop: false };
};


const countdown = document.getElementById("countdown");

if (countdown !== undefined) {
  const startingAt = parseInt(countdown.dataset.startingAt);

  const updateCountdownId = setInterval(() => {
    const status = updateCountdown(startingAt);

    if (status.shouldStop) {
      console.log('Seance started, stop countdown');
      clearInterval(updateCountdownId);
    }
  }, 1000);
}
