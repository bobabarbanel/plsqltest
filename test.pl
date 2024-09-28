#!/usr/bin/perl
## another new line added on github
# this line added to branch test
use strict;
use warnings;
use DBI;
###################### Testing Git Push with new line in file
###################### Adding another comment

# Database connection settings
my $dsn      = "DBI:mysql:database=testing_db;host=localhost";
my $username = "root";
my $password = "admin";

# Connect to the database
my $dbh =
  DBI->connect( $dsn, $username, $password,
    { RaiseError => 1, AutoCommit => 1 } )
  or die "Could not connect to database: $DBI::errstr";

# Prepare SQL query to fetch all data from 'datatable'
my $sql = "SELECT * FROM posts";
my $sth = $dbh->prepare($sql);
$sth->execute();

# Retrieve column names
my @column_names = @{ $sth->{NAME} };

# Retrieve all rows of data
my @rows;
while ( my @row = $sth->fetchrow_array() ) {
    push @rows, \@row;
}

# Clean up
$sth->finish();
$dbh->disconnect();

# Print results for verification (optional)
print "Column Names: ", join( ", ", @column_names ), "\n";
print "Rows:\n";
foreach my $row (@rows) {
    print join( ", ", @$row ), "\n";
}

# Now @column_names holds the column names
# and @rows holds the row values (each row is an array reference)
