# README

### Using:
* Ruby version 3.0.1
* Rails version 6.1.3
* Postgresql

### To setup the application locally:

* In the application root directory create file '.env'. Place to it a line that describe DATABASE_URL. E.g.:
DATABASE_URL=postgres://user:password@localhost:5432/bacano_questionnaires_development

#### In a terminal from the application directory run next commands:
* bundle
* yarn
* rails db:create
* rails db:migrate

### Populate the database with questionnaires:

- Questionnaires are in the directory 'data_source' (every questionnaire in the separate .yml file). 
- To import data from them to database use command: rake import:questionnaire['{file_name.yml}']. E.g.: 

rake import:questionnaire['eligibility.yml']

rake import:questionnaire['english.yml']

### To run the application in the separate terminals from the application directory run:
* yarn dev
* rails server 
