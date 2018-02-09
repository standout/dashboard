window.addEventListener('turbolinks:load', function () {
  const chartEl = document.getElementById("myChart")
  const dataset = window.jsonDataset
  if (!chartEl || !dataset) { return }

  const dataList = dataset['data'].map(array => array[1])
    .sort(function(a, b){return b-a});
  const ctx = chartEl.getContext('2d');
  Chart.defaults.global.defaultFontFamily = "geogrotesque";
  const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: dataset['data'].map(array => array[0]),
      datasets: [{
        label: dataset['title'],
        data: dataList,
        backgroundColor: [
          `#db6052`,
          `#db6052`,
          `#db6052`,
          `#db6052`,
          `#db6052`,
          `#db6052`
        ],
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero:true
          }
        }]
      }
    }
  });
})
