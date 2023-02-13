//Darrius White (z1900146)
//CSCI 466-PE01/1
//Assign 10
//Due: 3/26/2021

#include <iostream>
#include <iomanip>
#include <string>
#include <mariadb/mysql.h>
using namespace std;

int main() {
   MYSQL *conn;
   MYSQL_RES *res;
   MYSQL_ROW row;

   const char *host = "courses";
   const char *user = "z1900146";
   const char *password = "1997Apr21";
   const char *database = "henrybooks";

   conn = mysql_init(NULL);

   /* Connect to database */
   if (!mysql_real_connect(conn, host,
        user, password, database, 0, NULL, 0)) {

      fprintf(stderr, "%s\n", mysql_error(conn));
      exit(1);
   }

string myquery, title_input, author_input;
int user_option;


//Loop for menu
while(user_option != 4){

  //Menu options
  cout << "Choose an Option:\n"
       << "-----------------\n"
       << "1. Book List\n"
       << "2. Author Search\n"
       << "3. Title Search\n"
       << "4. Quit\n\n"
       << "Option: ";


  cin >> user_option;
  cin.ignore();


  switch(user_option)
  {
    case 1:
	//Book List option
	cout << "You chose Book List\n\n";

	//Header for Book List output
	cout << "Title                                     "
	     << "Author                                  "
	     << "Price" << endl;
	cout << "========================================= "
	     << "======================================= "
	     << "=====" << endl;


	//Hold query to show all books
	myquery = "SELECT DISTINCT Title, AuthorLast, AuthorFirst, Price "
                  "FROM Wrote "
                  "JOIN Book USING(BookCode) "
                  "JOIN Author USING(AuthorNum) "
                  "GROUP BY Title "
                  "ORDER BY Sequence";


	//Test for error
	if (mysql_query(conn, myquery.c_str())){
           fprintf(stderr, "%s\n", mysql_error(conn));
           exit(1);
   	}


   	res = mysql_use_result(conn);


	//Outputted Book List results
	while ((row = mysql_fetch_row(res)) != NULL){

	   cout << setw(42) << left << row[0] << setw(15) << row[1]
		<< setw(15) << row[2] << setw(15) << right << row[3] << endl;
	}

	cout << "================================================"
	     << "=======================================\n" << endl;


	break;

    case 2:
	//Author Search Option
	cout << "You chose Author Search\n\n";


   	//get user input for author
	cout << "Enter Author last name: ";
   	getline(cin, author_input);


	//Header for Author output
	cout << endl;
	cout << "BookCode "
	     << "Title                                           "
	     << "Author                 "
	     << "Price" << endl;

	cout << "======== "
	     << "=============================================== "
	     << "====================== "
	     << "=====" << endl;


	//Hold query to show Author details
	myquery = "SELECT DISTINCT BookCode, Title, AuthorLast, AuthorFirst, Price, OnHand, BranchName, BranchLocation "
                  "FROM Wrote "
                  "JOIN Book USING(BookCode) "
                  "JOIN Inventory USING(BookCode) "
                  "JOIN Branch USING(BranchNum) "
                  "JOIN Author USING(AuthorNum) "
                  "WHERE AuthorLast = '" + author_input + "' "
                  "ORDER BY Sequence ";


	//Test for error
	if (mysql_query(conn, myquery.c_str())){
           fprintf(stderr, "%s\n", mysql_error(conn));
           exit(1);
   	}

   	res = mysql_use_result(conn);


   	//Outputted Author results
   	while ((row = mysql_fetch_row(res)) != NULL){

           cout << "    " << right << row[0] << " " << setw(42) << left
		<< row[1] << '\t' << " " << row[2] << ", " << row[3]
                << setw(15) << right << row[4] << endl;

           cout << '\t' << " - " << row[5] << " available at " << row[6]
		<< '(' << row[7] << ')' << '\n' << endl;
	}

	cout << "================================================"
	     << "=====================================\n" << endl;

	break;

    case 3:
	//Title search option
	cout << "you chose Title Search\n\n";


   	//get user input for title
	cout << "Enter Title: ";
   	getline(cin, title_input);


	//Header for Title output
	cout << endl;
        cout << "BookCode "
	     << "Title                                           "
	     << "Author                 "
	     << "Price" << endl;

        cout << "======== "
	     << "=============================================== "
	     << "====================== "
	     << "=====" << endl;



	//Hold query to show Title details
	myquery = "SELECT DISTINCT BookCode, Title, AuthorLast, AuthorFirst, Price, OnHand, BranchName, BranchLocation "
                  "FROM Wrote "
                  "JOIN Book USING(BookCode) "
                  "JOIN Inventory USING(BookCode) "
                  "JOIN Branch USING(BranchNum) "
                  "JOIN Author USING(AuthorNum) "
                  "WHERE Title = '" + title_input + "' "
                  "ORDER BY Sequence ";


	//Test for error
	if (mysql_query(conn, myquery.c_str())){
           fprintf(stderr, "%s\n", mysql_error(conn));
           exit(1);
   	}

   	res = mysql_use_result(conn);


   	//Outputted Title results
   	while ((row = mysql_fetch_row(res)) != NULL){

           cout << "    " << right << row[0] << " " << setw(42) << left
		<< row[1] << '\t' << " " << row[2] << ", " << row[3]
                << setw(15) << right << row[4] << endl;

           cout << '\t' << " - " << row[5] << " available at " << row[6]
		<< '(' << row[7] << ')' << '\n' << endl;
	}

	cout << "================================================="
	     << "====================================\n" << endl;

	break;

    case 4:
	//Quit Option
	cout << "Goodbye\n";
	exit(1);
	break;

    default:
	//Input other than what is expected
	cout << "That is not an option, try again\n\n";
	break;
  }
}

   /* close connection */
   mysql_free_result(res);
   mysql_close(conn);

  return 0;
}

