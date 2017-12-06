const players_present = document.getElementById("players_present");

const getPlayersCount = (url) => {
  fetch(url, {
    method: "GET",
    headers: {
      "Accept": "text/javascript",
      "Content-Type": "text/javascript",
    },
  });
};


if (players_present !== undefined) {
  // recuperer l'url qui devra être interrogée
  // faire l'appel AJAX sur cette url
  // toutes les X secondes, refaire l'appel
  const url = players_present.dataset.playersCountUrl;

  // setInterval(() => {
    getPlayersCount(url);
  // }, 2000);
}
