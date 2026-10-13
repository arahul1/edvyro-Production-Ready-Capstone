
CREATE TABLE IF NOT EXISTS internships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    role TEXT NOT NULL CHECK(length(trim(role)) BETWEEN 2 AND 120),
    company TEXT NOT NULL CHECK(length(trim(company)) BETWEEN 2 AND 120),
    domain TEXT NOT NULL CHECK(domain IN (
        'Web Development',
        'AI/ML',
        'Data Science',
        'Cybersecurity',
        'UI/UX Design',
        'Other'
    )),
    location TEXT NOT NULL CHECK(length(trim(location)) BETWEEN 2 AND 120),
    stipend TEXT NOT NULL CHECK(length(trim(stipend)) BETWEEN 1 AND 80),
    duration TEXT NOT NULL CHECK(length(trim(duration)) BETWEEN 1 AND 80),
    description TEXT NOT NULL CHECK(length(trim(description)) BETWEEN 10 AND 2000),
    apply_url TEXT NOT NULL CHECK(length(apply_url) BETWEEN 1 AND 2048),
    created_at TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_internships_domain
ON internships(domain);

CREATE INDEX IF NOT EXISTS idx_internships_role
ON internships(role);
CREATE TABLE IF NOT EXISTS applications (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  internship_id INTEGER NOT NULL,
  applicant_name TEXT NOT NULL
    CHECK (length(trim(applicant_name)) BETWEEN 2 AND 80),
  email TEXT NOT NULL
    CHECK (length(trim(email)) BETWEEN 3 AND 254),
  cover_message TEXT NOT NULL
    CHECK (length(trim(cover_message)) BETWEEN 20 AND 1000),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (internship_id)
    REFERENCES internships(id)
    ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_applications_internship_id
ON applications(internship_id);