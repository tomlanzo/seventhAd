const ranking = document.getElementById("ranking");

const getPlayersOrdered = (url) => {
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

if (ranking) {
  // recuperer l'url qui devra être interrogée
  // faire l'appel AJAX sur cette url
  // toutes les X secondes, refaire l'appel
  const url = ranking.dataset.playersOrderedUrl;

  setInterval(() => {
    getPlayersOrdered(url);
  }, 2000);
}
