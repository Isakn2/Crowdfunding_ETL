-- Create the Contacts Table
CREATE TABLE Contacts (
    contact_id INT NOT NULL,          -- Primary key for the Contacts table
    first_name VARCHAR(30) NOT NULL,  
    last_name VARCHAR(30) NOT NULL,   
    email VARCHAR(50) NOT NULL,       
    CONSTRAINT pk_contacts PRIMARY KEY (contact_id) -- Primary key constraint
);

-- Create the Category Table
CREATE TABLE Category (
    category_id VARCHAR(10) NOT NULL, -- Primary key for the Category table
    category_name VARCHAR(30) NOT NULL, 
    CONSTRAINT pk_category PRIMARY KEY (category_id) -- Primary key constraint
);

-- Create the Subcategory Table
CREATE TABLE Subcategory (
    subcategory_id VARCHAR(10) NOT NULL, -- Primary key for the Subcategory table
    subcategory_name VARCHAR(30) NOT NULL, 
    CONSTRAINT pk_subcategory PRIMARY KEY (subcategory_id) -- Primary key constraint
);
    
-- Create the Campaign Table
CREATE TABLE Campaign (
    cf_id INT NOT NULL,               -- Primary key for the Campaign table
    contact_id INT NOT NULL,          -- Foreign key referencing Contacts
    company_name VARCHAR(30) NOT NULL, 
    description TEXT NOT NULL,        
    goal DECIMAL NOT NULL,            
    pledged DECIMAL NOT NULL,        
    outcome VARCHAR(50) NOT NULL,     
    backers_count INT NOT NULL,       
    country VARCHAR(10) NOT NULL,     
    currency VARCHAR(10) NOT NULL,    
    launch_date DATE NOT NULL,        
    end_date DATE NOT NULL,           
    category VARCHAR(30) NOT NULL,    
    subcategory VARCHAR(30) NOT NULL, 
    category_id VARCHAR(10) NOT NULL, -- Foreign key referencing Category
    subcategory_id VARCHAR(10) NOT NULL, -- Foreign key referencing Subcategory
    CONSTRAINT pk_campaign PRIMARY KEY (cf_id) -- Primary key constraint
);

-- Add Foreign Key Constraint for contact_id in Campaign Table
ALTER TABLE Campaign 
ADD CONSTRAINT fk_campaign_contact_id 
FOREIGN KEY(contact_id) REFERENCES Contacts(contact_id);

-- Add Foreign Key Constraint for category_id in Campaign Table
ALTER TABLE Campaign 
ADD CONSTRAINT fk_campaign_category_id 
FOREIGN KEY(category_id) REFERENCES Category(category_id);

-- Add Foreign Key Constraint for subcategory_id in Campaign Table
ALTER TABLE Campaign 
ADD CONSTRAINT fk_campaign_subcategory_id 
FOREIGN KEY(subcategory_id) REFERENCES Subcategory(subcategory_id);

-- Verify the Contacts Table
SELECT * FROM Contacts LIMIT 5;

-- Verify the Category Table
SELECT * FROM Category LIMIT 5;

-- Verify the Subcategory Table
SELECT * FROM Subcategory LIMIT 5;

-- Verify the Campaign Table
SELECT * FROM Campaign LIMIT 5;

