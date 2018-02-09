window.addEventListener('turbolinks:load', () => {
  if (!window.nextProvider) { return }

  setTimeout(() => {
    Turbolinks.visit(`/?provider=${window.nextProvider}`)
  }, 2000)
})
