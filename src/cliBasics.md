# PHP CLI Basics

## Get the PHP version

```php
php -v

# or

php --version 

# PHP 8.1.6 (cli) (built: May 11 2022 01:14:18) (NTS gcc x86_64)
# Copyright (c) The PHP Group
# Zend Engine v4.1.6, Copyright (c) Zend Technologies
#    with Zend OPcache v8.1.6, Copyright (c), by Zend Technologie
```


## Get the PHP Configuration

> You could have a few different `php.ini` files.

### Get the full `php.ini` file details

```php
php -i
```

> When you execute the command above you are specifically requesting the `php.ini` that is responsible for the `command line` and is not nessesarly the same one as the one `Apache` might be using at `runtime`. 

### Full list of `ini` files for PHP

```php
php --ini
```

### Get specific value or values

```php
php -i | grep "memory" 
```

## Get the installed PHP Modules

###  Get the full of modules

```php
php -m
```

###  Get specific module or modules
```php
php -m | grep "xml"
```

## Get info on PHP functions and Classes

To get these you have to use some reflection type functions

### Funcitons

```php
php --rf str_replace

# Function [ <internal:standard> function str_replace ] {
# 
#   - Parameters [4] {
#     Parameter #0 [ <required> array|string $search ]
#     Parameter #1 [ <required> array|string $replace ]
#     Parameter #2 [ <required> array|string $subject ]
#     Parameter #3 [ <optional> &$count = null ]
#   }
#   - Return [ array|string ]
# }
```

### Classes

```php
php --rc StdClass

# Class [ <internal:Core> class stdClass ] {
# 
#   - Constants [0] {
#   }
# 
#   - Static properties [0] {
#   }
# 
#   - Static methods [0] {
#   }
# 
#   - Properties [0] {
#   }
# 
#   - Methods [0] {
#   }
# }

#or

php --rc DateTime

# Output very long... so not showing it here
```

## PHP Web Server

```php
php -S localhost:8090

# This command will start a web server from the current folder and run index.php
```

Or you can pipe the result of a string to `PHP` to evaluate

```php
echo '<?php echo "Hello world"; ?>' | php
```

## PHP in the CRON

Specify the full path to the PHP CLI executable and PHP script. CRON does not know the full path to the PHP executable. _Note: Unless you set the path to the PHP executable in the environment path config for the profile._

```php
# Wrong CRON config:
* * * * *       php /var/html/myPhpCode.php

# Right CRON config:
* * * * *       /usr/bin/php /var/html/myPhpCode.php
```

### Pipe PHP CRON script output to a log

Save yourself a ton of effort and pipe the PHP CRON output to a log file. It will make it easy to see any errors and allow you to post messages for debugging purposes.

```php
* * * * *       /usr/bin/php /var/html/myPhpCode.php >> /var/html/my.log  2>&1
```

The CRON entry (as mentioned above) will output all standard and error output in append mode to ‘my.log’. You can also change the ‘>>’ to ‘>’ to overwrite the ‘my.log’ file instead of appending content.


### Pass arguments to your PHP CLI script

CLI arguments can enhance your PHP script and allow interactivity via the command line.

Provide an argument to your PHP script like this:

```php
/usr/bin/php /var/html/myPhpCode.php theArg
```

Example code:

```php
 if (isset($argv[1])) {
     $myArg= $argv[1];
 } else {
     $myArg= "";
     echo "no arguments have been set!";
     exit;
 }
 ```

### Enable “display errors” via the PHP CLI

Enable and display any PHP errors by adding the -d argument.

```php
/usr/bin/php -d display_errors=1 /var/html/myPhpCode.php
```

#### Test your PHP CLI Script without the `php.ini` config

You can disable the `php.ini` config when you run your PHP CLI script

```php
/usr/bin/php -n /var/html/myPhpCode.php
```

#### Check your syntax via the PHP CLI

Use the PHP CLI to check your PHP language syntax by using:

```php
/usr/bin/php -l /var/html/myPhpCode.php

# No syntax errors detected in /var/html/myPhpCode.php
```

#### The PHP CLI config file

PHP and PHP CLI uses different php.ini files. Locate the PHP CLI file by using:

```php
php -i | grep php.ini

# Configuration File (php.ini) Path => /etc/php/7.2/cli
# Loaded Configuration File => /etc/php/7.2/cli/php.ini
```

#### View CRON logs 

You can use the following to filter the Syslog for CRON output:

```php
sudo grep – color -i cron /var/log/syslog

# Apr 11 03:15:01 ap-2a-adonis CRON[26625]: (root) CMD (/var/html/myPhpCode.php >> /var/html/myPhpCode.log 2>&1)
```

#### View Apache Logs

The Apache error logs will prove to be your friend when debugging PHP CLI issues.

The location of the apache error logs depends on your Linux configuration:

- RHEL / Red Hat / CentOS / Fedora – `/var/log/httpd/error_log`
- Debian / Ubuntu Linux Apache – `/var/log/apache2/error.log`
- FreeBSD Apache – `/var/log/httpd-error.log`

## Interactive Shell

To start the PHP interactive shell:

```php
php -a
```


