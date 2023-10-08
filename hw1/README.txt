ER Diagram for COVID-19 contact tracing system

The design idea: entity with more connections is placed towards left which connects to other entities through weak and strong connections.

Entities and it's Relations with assumptions:

1) EMPLOYEES: Employees entity has all employees data such as employeeid name, phonenumber and email, floor number
              Assumed EMPLOYEES  will have one -to many records with SCANRECORDS entity.
              each employee will be associated to multiple meetings.
              each employee will be having multiple test records and zero or more symptoms.
              multiple employees will be notified in one or multiple ways.
              employees will also have 1 to zero or many relations with status entity

2) SCANRECORDS: This entity will have scanned record details such as temperature and employee id and updated time.
                SCANRECORDS will have zero or one relationship with symptoms records assuming that employee scanned might or might not have symptoms.
                scanned employees might have to get test done at least once so keeping it a one-to-one relationship.

3) SYMPTOMSRECORDS: This entity consists of all the five symptoms associated to each employee along with id and updated time.
                    this entity acts a week entity to all the other entities connected to it as there might exist a case where no employee might have any symptoms to record.

4) MEETING: this entity acts a bridge between meeting details  entity and employees entity.
            each employee might be associated with none or multiple meetings at a give time

5) MEETINGDETAILS: MEETINGDETAILS entity will have the details of meeting at that point of the day such as the time start time of the meeting employee id and the room
                   this entity will have a one-to one relationship with meeting entity as one meeting id plus employee id can be associated with one meeting id.

6) TESTRECORDS: TESTRECORDS entity will have reports about employees test result and will have a one-to one relationship with SCANRECORDS assuming that once scanned that employee might or might not be tested.
                it will also have many -to many relationship with STATUS entity assuming one test record employee will need to be tested and updated every day.
                it will have one to zero or many cardinality to  tracing entity as once tested the employee might or might not have been contacted by any other employees.

7) TRACING: This entity will have all the tracing details of the employees who reports positive in the test record entity.
            assuming a one or many relationship with employee table that is there can be multiple employees that needs to be contacted.
            TRACING entity

8) NOTIFICATION: This entity will have notification details of employees that were traced.
                 each employee traced will be notified in multiple way so one -to many relationship.
                 each employee who were in close contact with the person during the meetings will have a one to many cardinality.
                 NOTIFICATION entity will have a week connection as there might exist no positive cases, we don't have to notify any employees.

9) STATUS: STATUS entity will store the health status of employees who tested positive.
            this status entity will have a many -to many relationship with TESTRECORDS.


