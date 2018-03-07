<?php

/**
 * Configuration for database connection
 *
 */

$host       = "aa9oul8p1pwnp2.ccmonfdvzpe4.us-west-2.rds.amazonaws.com";
$username   = "root";
$password   = "hiretrinimbus";
$dbname     = "test"; // will use later
$dsn        = "mysql:host=$host;dbname=$dbname"; // will use later
$options    = array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
              );
			  ?> 