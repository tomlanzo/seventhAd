var ranking = document.getElementById("ranking");

var getPlayersOrdered = function(url) {
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
  var url = ranking.dataset.playersOrderedUrl;

  var beginQueryAt = new Date().getTime();

  var setIntervalId = setInterval(function() {
    getPlayersOrdered(url);

    var now = new Date().getTime();

    if (now > (beginQueryAt + 120 * 1000)) {
      clearInterval(setIntervalId);
    }
  }, 2000);
}
