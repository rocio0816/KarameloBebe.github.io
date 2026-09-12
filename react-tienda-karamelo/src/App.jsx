import './App.css'

function App() {
  return (
    <iframe
      className="karamelo-page"
      src={`${import.meta.env.BASE_URL}karamelo-original.html`}
      title="Karamelo — Suavidad y amor desde el primer día"
    />
  )
}

export default App
