create table Readers(
    Reader_id SERIAL PRIMARY KEY,
    Full_Name VARCHAR(1000) NOT NULL,
    Telephone VARCHAR(20) NOT NULL
);

create table Books (
    ISBN VARCHAR(100) PRIMARY KEY,
    Title VARCHAR(1000) NOT NULL,
    Year_of_publication INT CHECK(Year_of_publication > 0)
);

create table Authors (
    Author_id INT PRIMARY KEY,
    Author_full_name VARCHAR(1000) NOT NULL
);

create table Book_Authors (
    Author_id INT NOT NULL,
    Book_id VARCHAR(100) NOT NULL,
    PRIMARY KEY(Author_id, Book_id),
    FOREIGN KEY(Book_id) REFERENCES Books(ISBN),
    FOREIGN KEY(Author_id) REFERENCES Authors(Author_id)
);

create table Loans (
    id_loan SERIAL PRIMARY KEY,
    Reader_id INT NOT NULL,
    Book_id VARCHAR(100) NOT NULL,
    FOREIGN KEY(Reader_id) REFERENCES Readers(Reader_id),
    FOREIGN KEY(Book_id) REFERENCES Books(ISBN),

    loan_date INT NOT NULL,
    planned_return_date INT NOT NULL,
    actual_return_date INT,

    CHECK(actual_return_date IS NULL OR actual_return_date >= loan_date),
    CHECK(planned_return_date >= loan_date)
);
