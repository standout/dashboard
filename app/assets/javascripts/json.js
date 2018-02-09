// Double click on a chart to see the json data in a modal.
// Double click it or press <Esc> to close it.
// Only enabled in development.
document.addEventListener('turbolinks:load', () => {
  const jsonEl = document.querySelector('#json')
  if (!jsonEl) { return }

  jsonEl.addEventListener('dblclick', () => {
    jsonEl.classList.add('hidden')
  })

  window.addEventListener('dblclick', (event) => {
    let node = event.target
    while(true) {
      node = node.parentNode
      if (!node || !node.classList) { return }
      if (node.classList.contains('chart')) { break }
    }
    jsonEl.innerHTML = node.querySelector('.hidden-json-data').innerHTML
    jsonEl.classList.remove('hidden')
  })

  window.addEventListener('keydown', event => {
    switch (event.key) {
      case 'Escape': {
        jsonEl.classList.add('hidden')
      }
    }
  })
})
