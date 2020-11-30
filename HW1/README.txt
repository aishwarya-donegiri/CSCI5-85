Homework 1

Design choices for the entities and attributes, and their corresponding reasons:

1. Student:
- The Student_ID is the unique ID given to every student and serves are a primary key to refer to the each student when needed. For example, the books borrowed by the student can be tracked by using the Student_ID as a foreign key in the Library_Book table.
- The fee paid by every student is constant and can be calculated by multiplying the number of students by the fixed amount.

2. Library_Book:
- The table holds list of library books with Book_ID as their primary key.
- The number of days a book was borrowed and the number of books borrowed(i.e., not exceeding 4 per student) by a student can be calculated using the foreign key Student_ID. The Duration_Borrowed attribute keeps track of the duration for which a book is borrowed which should not exceed 2 weeks).
- The Library_Code would map to the Library table which gives information about the library the book is available in, in case there is more than one library. Otherwise, the attribute and the Library table both can be dropped.

3. Schedule: 
- Students are provided with the schedule from the schedule table which has information about the room assigned to a particular course, on a given day.
- A composite key is used here for unique idenfication of the table to accommodate the fact that a course can have muliple sessions throughout the day.

4. Payroll:
- The table holds payroll information of each instructor based on the number of teaching and supervising hours.
- The Teaching_Hours and Supervising_Hours are calculated from the Time in the Schedule table for the courses the instructor would be taking.

5. Rating:
- This table holds the ratings given the students for each of the courses that they have taken and the instructor associated with the course.
- Students can have multiple entries in the table, as they take up multiple courses. For example, Ema takes up python coding class and the arduino project together, which are two courses which implies she might have two entries.

6. Instructor:
- The instructor can offer multiple courses and also teach/supervise multiple courses.
- The payroll table tracks this information and pays him accordingly.

7. Course:
- Each course has a unique Course_ID and information about the instructor taking the course.
- The course can either be a Coding_class or Project, but not both.
- This helps us have common properties such as Course_ID and Instructor_ID for each course.
- The two tables Coding_class and Project are disjoint and the course has to definitely be one of the two.
- The attribute Course_Type will give us the information about each of the courses.

8. Coding_Class:
- The foreign key Text_Book_ID gives information about the text book prescribed by the instructor.
- Every coding class definitel has a text_Book.
- The same text book can be used for multiple coding classes.
- The language_name attribute specifies which language the course is based on.
- Assumption - A coding class is associated only with one language.

9. Text_Book:
- A instructor can prescribe multiple text books depending upon the courses he is taking.
- A textbook can be prescribed by multiple professors, if they prefer the same book for multiple courses.

10. Project:
- Each project has a list of parts.
- Every project has a micro-controller associated with it.
- The Parts_List table would contain the list of parts required for each project.

11.Parts_List:
- A parts list can have multiple parts and each part can be in multiple parts list as multiple projects might require the same part.
- Combination of Parts_List_ID and Parts_ID is chosen as the composite key to have a unique combination.

12. Micro-controller & Language:
- Table has different types of micro-controllers for the projects, microcontrollers and the project have a 1-1 relationship as they are mandatory.
- The Part_ID in the table corresponds to its ID in the Parts table.
- Language table has different languages that a coding class could have.

13. Parts:
- The Part_type would specify the type of the parts namely microcontrollers, sensors and other hardware.
- the Part_ID would be the rpimary key used to link the table to other tables.

14. Order:
- Holds the list of parts in each order.
- A part can be present in multiple orders and an order can have multiple parts, therefore Part_ID from parts table and Order_ID from order table are chosen as composite key.
- The supplier associated with a particular order can also be tracked.

15. Supplier:
- There can be no orders or multiple orders from a supplier.
- There is only one supplier for a single order.

16. Room:
- Has details of the room in which a course is held depending upon the timing and date as mentioned in the schedule table.

17. Enrollment: 
- This is a bridge table to track the the list of students enrolled in various courses.
- The table has additional details such as time and date of enrollment.
  



