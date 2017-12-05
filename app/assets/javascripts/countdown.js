const updateCountdown = (startingAt) => {
  const now = new Date().getTime() / 1000;
  const diff = startingAt - now;

  if (diff >= 0) {
    const label = `${diff}s`;
    countdown.innerText = label;
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
