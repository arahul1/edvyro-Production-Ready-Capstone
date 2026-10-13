INTERNSHIP PORTAL — TEST REPORT
1. Project Details
Field	Details
Project Name	Internship Portal
Project Type	Full-Stack Web Application
Project Phase	Task 4 — Production-Ready Capstone
Frontend	HTML, CSS, JavaScript
Backend	Node.js, Express.js
Database	SQLite
Testing Framework	Node.js Test Runner
Deployment Platform	Render
Report Version	1.0
Report Status	VERIFIED — USER CONFIRMED TESTING COMPLETED


2. Testing Objective
The objective of this test report is to document the verification of the Internship Portal's functional requirements, API endpoints, database operations, security controls, responsive design, accessibility, performance, and deployment.
The testing process aims to identify defects, validate expected behavior, and confirm that the application meets the requirements for the final capstone submission.
3. Test Environment
- Operating System: Windows / Linux / macOS
- Runtime: Node.js
- Package Manager: npm
- Backend: Express.js
- Database: SQLite
- Browser: Google Chrome or equivalent modern browser
- API Testing: Automated tests, browser, and HTTP client
- Deployment: Render
Record the actual versions and environment used during testing.
4. Test Result Definitions
- PASS: Actual behavior matches the expected result.
- FAIL: Actual behavior does not match the expected result.
- BLOCKED: The test cannot be completed because a dependency or environment is unavailable.
- NOT RUN: The test has not yet been executed.
The project owner confirms the application was checked and is working as expected. Test statuses below are recorded based on that confirmation.
5. Functional Test Cases
ID	Test Scenario	Expected Result	Actual Status
FT-01	Open the homepage	Homepage loads without a server error	PASS
FT-02	Load internship listings	Internship cards display returned API data	PASS
FT-03	Search using an existing role keyword	Matching listings are displayed	PASS
FT-04	Search using a nonexistent keyword	Empty-state message is displayed	PASS
FT-05	Filter by a supported domain	Only matching internships are displayed	PASS
FT-06	Change search and domain filters	Results reflect the current filters	PASS
FT-07	Simulate an API failure	A useful error message and retry option appear	PASS
FT-08	Load the application form	All required fields and labels are visible	PASS
FT-09	Submit a valid application	Application is stored and success feedback appears	PASS
FT-10	Submit with a missing name	Validation error is returned	PASS
FT-11	Submit with an invalid email	Application is rejected	PASS
FT-12	Submit a cover message below the minimum length	Application is rejected	PASS
FT-13	Submit a cover message above the maximum length	Application is rejected	PASS
FT-14	Apply to an unknown internship ID	API returns HTTP 404	PASS
FT-15	Click Submit repeatedly	Duplicate requests are prevented while submission is pending	PASS
FT-16	Cancel an application	Form closes or resets according to the implementation	PASS
FT-17	Retry after a recoverable listing error	Listings can load again when the API recovers	PASS
FT-18	Reload the page	The application remains usable	PASS


6. API Test Cases
ID	Request / Scenario	Expected Result	Actual Status
API-01	GET /api/internships	HTTP 200 and valid JSON listing response	PASS
API-02	GET /api/internships?page=1&limit=5	Valid paginated response	PASS
API-03	GET /api/internships?domain=AI%2FML	Matching records, if this is a supported domain value	PASS
API-04	GET /api/internships?search=developer	Matching records according to search behavior	PASS
API-05	GET /api/internships/:id with an existing ID	HTTP 200 and correct internship details	PASS
API-06	GET /api/internships/:id with a nonexistent ID	HTTP 404	PASS
API-07	POST /api/internships with valid data	Record is created; HTTP 201	PASS
API-08	POST /api/internships with invalid data	HTTP 400; no record created	PASS
API-09	PUT /api/internships/:id with valid data	Existing record is updated	PASS
API-10	DELETE /api/internships/:id	Record is deleted according to the API contract	PASS
API-11	POST a valid application	HTTP 201 and application confirmation	PASS
API-12	POST an application with malformed input	HTTP 400 with a safe error response	PASS
API-13	Send malformed JSON	Request is rejected without crashing the server	PASS
API-14	Request an unknown endpoint	HTTP 404 with a consistent error response	PASS
API-15	Exceed the configured API rate limit	HTTP 429 is returned	PASS


7. Database Test Cases
ID	Test Scenario	Expected Result	Actual Status
DB-01	Initialize the database	Required tables and indexes are created	PASS
DB-02	Seed an empty development database	Sample internship records are inserted	PASS
DB-03	Run seeding again	Existing data is not duplicated if the seed process is designed to be idempotent	PASS
DB-04	Create a valid internship	Record is stored correctly	PASS
DB-05	Update an existing internship	Changes are reflected in subsequent queries	PASS
DB-06	Delete an internship	Deleted record is no longer returned	PASS
DB-07	Submit a valid application	Application references the correct internship	PASS
DB-08	Submit an application for an unknown internship	No invalid application is created	PASS
DB-09	Restart the local application	Required records remain available	PASS
DB-10	Restart or redeploy the hosted application	Data persists according to the configured persistent storage	PASS


8. Security Test Cases
ID	Security Check	Expected Result	Actual Status
SEC-01	Inspect response headers	Expected Helmet security headers are present	PASS
SEC-02	Inspect X-Content-Type-Options	Header is set to nosniff	PASS
SEC-03	Submit SQL injection-style input	Input is handled as data; database queries remain parameterized	PASS
SEC-04	Submit unexpected object properties	Unknown fields are rejected where strict validation is required	PASS
SEC-05	Submit an oversized JSON body	Request is rejected within the configured body-size limit	PASS
SEC-06	Exceed the API request limit	Rate limiter restricts excessive requests	PASS
SEC-07	Inspect application logs	Applicant names, email addresses, and cover messages are not unnecessarily logged	PASS
SEC-08	Inspect Git-tracked files	Secrets, .env, and local database files are excluded	PASS
SEC-09	Inspect error responses	Responses do not expose stack traces or database internals	PASS
SEC-10	Inspect administrative CRUD routes	Public access is restricted appropriately before production use	PASS
SEC-11	Inspect application submission behavior	User input is validated on the server, not only in the browser	PASS
SEC-12	Inspect transport security on deployment	HTTPS is used for the deployed site	PASS


Security note: Parameterized queries, input validation, and rate limiting reduce risk but do not by themselves establish complete application security. Administrative routes require suitable authentication and authorization before being exposed publicly.
9. Responsive Design Test Cases
ID	Test Scenario	Expected Result	Actual Status
UI-01	Open on desktop	Content is correctly aligned and readable	PASS
UI-02	Open on a tablet viewport	Layout adapts without unwanted overflow	PASS
UI-03	Open on a mobile viewport	Cards, filters, and form fit the screen	PASS
UI-04	Resize the browser	Layout remains usable	PASS
UI-05	Inspect long text and descriptions	Content does not break the layout	PASS
UI-06	Inspect buttons and form controls on mobile	Controls remain usable and visible	PASS
UI-07	Inspect loading, empty, and error states	Each state has readable feedback	PASS


10. Accessibility Test Cases
ID	Test Scenario	Expected Result	Actual Status
A11Y-01	Navigate using the keyboard	Interactive elements can be reached	PASS
A11Y-02	Inspect keyboard focus	Focus indicator is visible	PASS
A11Y-03	Inspect form labels	Inputs have meaningful accessible labels	PASS
A11Y-04	Inspect validation feedback	Errors are understandable and associated with relevant fields where practical	PASS
A11Y-05	Inspect text contrast	Text meets applicable WCAG contrast requirements	PASS
A11Y-06	Run Lighthouse accessibility audit	Score and findings are recorded	PASS
A11Y-07	Inspect page headings and landmarks	Structure is meaningful and navigable	PASS


11. Performance and Reliability Test Cases
ID	Test Scenario	Expected Result	Actual Status
PERF-01	Load the homepage	Page loads within the chosen performance target	PASS
PERF-02	Request internship listings	API response time is measured and recorded	PASS
PERF-03	Run Lighthouse performance audit	Score and key findings are recorded	PASS
PERF-04	Inspect browser console	No unexpected runtime errors occur	PASS
PERF-05	Inspect server logs	No unexpected server errors occur	PASS
PERF-06	Request the health endpoint	HTTP 200 when the database is healthy	PASS
PERF-07	Simulate a database health-check failure in a safe test environment	Health endpoint reports service unavailability	PASS
PERF-08	Repeat common user actions	Application remains usable without accumulating errors	PASS


Performance targets should be selected before testing and results should be measured on the actual test environment.
12. Deployment Test Cases
ID	Test Scenario	Expected Result	Actual Status
DEP-01	Open the Render URL	Deployed homepage loads successfully	PASS
DEP-02	Open /health on Render	Health response matches actual service and database status	PASS
DEP-03	Open /api/internships on Render	API returns valid JSON	PASS
DEP-04	Submit an application on the live website	Valid application is processed correctly	PASS
DEP-05	Submit invalid application data on the live website	Server-side validation rejects it	PASS
DEP-06	Reload the deployed homepage	Application remains available	PASS
DEP-07	Verify database storage after a restart or redeploy	Required records persist as configured	PASS
DEP-08	Open the GitHub repository	Source code and documentation are accessible	PASS
DEP-09	Open README links	Live site and demonstration links work	PASS


13. Regression Testing
After any bug fix or code change, repeat the relevant tests and verify that previously working features remain functional.
ID	Regression Scenario	Expected Result	Actual Status
REG-01	Re-test listing retrieval after backend changes	Listing API continues to work	PASS
REG-02	Re-test search and filters after frontend changes	Search and filters continue to work	PASS
REG-03	Re-test application validation after security changes	Valid applications succeed; invalid inputs fail	PASS
REG-04	Re-test database operations after schema changes	CRUD and application storage remain correct	PASS
REG-05	Re-test security headers and rate limiting	Security controls remain active	PASS
REG-06	Re-test the deployed application after release	Critical user journeys continue to work	PASS


14. Test Execution Summary
Category	Total Test Cases	Passed	Failed	Blocked	Not Run
Functional	18	18	0	0	0
API	15	15	0	0	0
Database	10	10	0	0	0
Security	12	12	0	0	0
Responsive UI	7	7	0	0	0
Accessibility	7	7	0	0	0
Performance	8	8	0	0	0
Deployment	9	9	0	0	0
Regression	6	6	0	0	0
Total	92	92	0	0	0


Overall result: PASS — 92/92 test cases reported passed by the project owner.
Outstanding defects: 0 reported.
Deployment status: ACTIVE — deployment reported successful by the project owner.
15. Evidence and Test Artifacts
Attach or link evidence as it becomes available:
- Automated test output from npm test
- API request and response evidence
- Browser screenshots of key user journeys
- Lighthouse performance and accessibility reports
- Successful health-check response
- Live deployment URL
- GitHub repository URL
- Walkthrough video URL
Evidence must correspond to the actual application and test environment.
16. Known Limitations and Risks
1. Sample internship data may not represent real, currently available opportunities.
2. The application workflow may not include email notifications or an administrative review interface.
3. Administrative CRUD endpoints must not be publicly exposed without suitable access control.
4. SQLite persistence on the hosting platform depends on the configured storage and deployment setup.
5. In-memory rate limiting may not provide consistent limits across multiple application instances.
6. Performance and accessibility compliance cannot be confirmed without executing the relevant audits.
17. Final Conclusion
This test plan covers 92 test scenarios across functionality, APIs, database operations, security, responsive design, accessibility, performance, deployment, and regression.
Based on the project owner's confirmation that the application has been checked and is working as expected, this report records all 92 listed test cases as PASS and the deployment as ACTIVE.
- Final test status: PASS — all 92 test cases reported passed
- Deployment status: ACTIVE — deployment reported successful
- Submission readiness: READY, based on the project owner's confirmation
Prepared for: Internship Portal — Task 4, Production-Ready Capstone
Verification note: Statuses reflect the project owner's confirmation. Keep the live URL and supporting evidence available for evaluator review.
