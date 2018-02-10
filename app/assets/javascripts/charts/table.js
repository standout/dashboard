window.addEventListener('turbolinks:load', function () {
  Array.from(document.querySelectorAll('.chart--table__canvas')).forEach(chartEl => {
    const dataset = window.jsonDataset
    if (!chartEl || !dataset) { return }

    const dataList = dataset['data'].map(array => array[1])
    const backgroundsToChange = new Array(dataList.length).fill('#db6052')
    const ctx = chartEl.getContext('2d');
    Chart.defaults.global.defaultFontFamily = "geogrotesque"
    Chart.defaults.global.legend.display = false
    const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: dataset['data'].map(array => array[0]),
        datasets: [{
          data: dataList,
          backgroundColor: backgroundsToChange
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          yAxes: [{
            gridLines: {
              display: false,
              drawBorder: false
            },
            ticks: {
              beginAtZero: true,
              fontSize: 24,
              fontColor: '#333'
            }
          }],
          xAxes: [{
            gridLines: {
              display: false,
              drawBorder: false
            },
            ticks: {
              fontColor: "#333",
              fontSize: 32,
            }
          }]
        }
      }
    });
  })
})
