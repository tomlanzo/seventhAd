const players_present = document.getElementById("players_present");

const getPlayersCount = (url) => {
  $.ajax({
    url: url,
    method: "GET",
  });

  // fetch(url, {
  //   method: "GET",
  //   headers: {
  //     "X-Requested-With":'XMLHttpRequest',
  //     "Accept": "text/javascript",
  //     "Content-Type": "text/javascript",
  //   },
  // }).then((response) => {
  //   // response is a Response object
  // });
};


if (players_present !== undefined) {
  // recuperer l'url qui devra être interrogée
  // faire l'appel AJAX sur cette url
  // toutes les X secondes, refaire l'appel
  const url = players_present.dataset.playersCountUrl;

  setInterval(() => {
    getPlayersCount(url);
  }, 2000);
}
