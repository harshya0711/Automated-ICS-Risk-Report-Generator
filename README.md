
# 🚨 AutoRiskX: ICS Risk Reporting & Automation System

**AutoRiskX** is a fully simulated, end-to-end operational risk reporting and control assessment solution tailored for roles in ICS Risk Reporting, such as at American Express. This project automates risk classification, QA flag detection, and generates leadership-ready dashboards — all using SQL, Excel, and Tableau/Power BI.

---

## 📌 Project Objective

To simulate a real-world risk analytics engine that:
- Tracks and scores control failures across business functions.
- Flags quality assurance issues and unresolved risks.
- Automatically assigns risk ratings based on failure trends and QA volume.
- Provides dynamic reporting metrics ready for dashboards and audits.

---

## 🛠️ Tech Stack

- **SQL (MySQL)**: For data modeling, pipeline automation, KPI calculation.
- **Excel (Advanced)**: QA error detection engine with macros & conditional flags.
- **Power BI / Tableau**: For building RAG dashboards, trend reports, and summaries.
- **Faker**: Used for generating realistic sample data (names, dates, descriptions).

---

## 🧱 Database Schema

### `control_data`
| Column         | Description                          |
|----------------|--------------------------------------|
| control_id     | Unique ID for each control           |
| business_function | Business unit (Payments, Risk Ops, etc.) |
| control_name   | Name of the control                  |
| test_date      | Date the control was tested          |
| result         | Passed / Failed                      |
| risk_theme     | Thematic area of the risk            |
| owner          | Responsible party for the control    |

### `qa_issues`
| Column         | Description                          |
|----------------|--------------------------------------|
| issue_id       | QA issue ID                          |
| control_id     | Linked control                       |
| issue_description | QA flag reason                    |
| severity       | High / Medium / Low                  |
| detected_on    | Date issue was flagged               |
| resolved       | Boolean flag for resolution status   |

### `risk_summary`
| Column             | Description                        |
|--------------------|------------------------------------|
| function_id        | Unique ID                          |
| business_function  | Department                         |
| rating_date        | Date of assessment                 |
| automated_risk_rating | System-assigned RAG score       |
| flagged_issues     | Total unresolved QA issues         |
| comments           | Observations or alerts             |

---

## 📊 Key Features

- 📈 Control failure rate tracking across business functions.
- 🚩 QA issue severity heatmaps and resolution rates.
- 🧠 Automated risk scoring logic with RAG classification.
- 📅 Weekly spike detection using window functions.
- 📚 Thematic root cause analysis and trend summaries.

---

## 📂 File Structure

- `AutoRiskX_Database.sql`: Complete SQL schema + 100+ rows of dummy data.
- `README.md`: Project documentation.
- `dashboards/`: (Optional) Power BI / Tableau workbook files.
- `excel_qacheck/`: (Optional) Excel file with macros and QA flags.

---

## 🚀 Use Cases

- Simulate an interview-ready end-to-end project for ICS Risk roles.
- Use in dashboards, audit packs, or stakeholder reports.
- Extendable to include Python AI risk prediction or ML risk clustering.

---

## 📢 Recommended For

- Business Analysts in Risk, Controls, Compliance, or Audit domains.
- Data Analysts applying for American Express, Citi, JPMC, etc.
- Risk professionals learning SQL + dashboard integration.

---

## 📄 License

This project is provided for educational and portfolio purposes. No real company data used.
