import { Link, Route, Routes } from 'react-router-dom';

function Home() {
  return (
    <main className="container">
      <h1>Financial Journal Entry System</h1>
      <p>Starter application for the Full Stack Developer assessment.</p>
      <nav>
        <Link to="/journal-entries">Journal Entries</Link>
      </nav>
    </main>
  );
}

function JournalEntries() {
  return (
    <main className="container">
      <h1>Journal Entries</h1>
      <p>Implement the journal entry list, create, and details screens here.</p>
      <Link to="/">Back to home</Link>
    </main>
  );
}

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/journal-entries" element={<JournalEntries />} />
    </Routes>
  );
}
