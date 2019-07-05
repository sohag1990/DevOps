# Hola :-)

### WP Cli basic commands
############ Ref https://developer.wordpress.org/cli/commands/

#keep the wp-cli.phar file in wp root directory
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# to check the wp-cli works
php wp-cli.phar --info
# make the wp-cli.phar file executable 
chmod +x wp-cli.phar 
# keep it in bin/wp directory or somewhere else to make the command handy. now only command will work as "wp"
sudo mv wp-cli.phar /usr/local/bin/wp 
# if this command work then wp cli installed succesfully
wp --info
# to update wp cli
sudo wp cli update 

# List alias information.
wp cli alias list
---
# @all: Run command against every registered alias.
# @local:
#   user: wpcli
#   path: /Users/wpcli/sites/testsite

# Get alias information.
wp cli alias get @dev
# ssh: dev@somedeve.env:12345/home/dev/

# Add alias.
wp cli alias add prod --set-ssh=login@host --set-path=/path/to/wordpress/install/ --set-user=wpcli
# Success: Added '@prod' alias.

# Update alias.
wp cli alias update @prod --set-user=newuser --set-path=/new/path/to/wordpress/install/
# Success: Updated 'prod' alias.

# Delete alias.
wp cli alias delete @prod
# Success: Deleted '@prod' alias.

# install and  plugin to wordpress by cli
wp plugin install pluginName --activate 

wp plugin list
wp plugin list --status=active
wp plugin list --status=active --format=json
wp plugin activate akismet
wp plugin deactivate akismet
wp plugin uninstall akismet
# Delete plugin
wp plugin delete paid-membership-pro

# Delete inactive plugins
wp plugin delete $(wp plugin list --status=inactive --field=name)

#wp scaffold plugin to create/initialize new plugin
wp scaffold plugin sample-plugin
wp scaffold plugin --prompt





##control maintenance mode

# Activate Maintenance mode.
wp maintenance-mode activate
# Enabling Maintenance mode...
# Success: Activated Maintenance mode.

# Deactivate Maintenance mode.
wp maintenance-mode deactivate
# Disabling Maintenance mode...
# Success: Deactivated Maintenance mode.

# Display Maintenance mode status.
wp maintenance-mode status
# Maintenance mode is active.

# Get Maintenance mode status for scripting purpose.
wp maintenance-mode is-active
echo $?
# 1


#Installing packages for WP Cli
wp package install wp-cli/admin-command # to install admin package
wp package install wp-cli/dist-archive-command # to install wp dist-archive


# Set cache.
wp cache set my_key my_value my_group 300
# Success: Set object 'my_key' in group 'my_group'.

# Get cache.
wp cache get my_key my_group
# my_value

# Add 'spectate' capability to 'author' role.
wp cap add 'author' 'spectate'
# Success: Added 1 capability to 'author' role.

# Add all caps from 'editor' role to 'author' role.
wp cap list 'editor' | xargs wp cap add 'author'
# Success: Added 24 capabilities to 'author' role.

# Remove all caps from 'editor' role that also appear in 'author' role.
wp cap list 'author' | xargs wp cap remove 'editor'
# Success: Removed 34 capabilities from 'editor' role.

# Clear the internal WP-CLI cache.
wp cli cache clear
# Success: Cache cleared.

# Create a new comment.
wp comment create --comment_post_ID=15 --comment_content="hello blog" --comment_author="wp-cli"
# Success: Created comment 932.

# Update an existing comment.
wp comment update 123 --comment_author='That Guy'
# Success: Updated comment 123.

# Delete an existing comment.
wp comment delete 1337 --force
# Success: Deleted comment 1337.

# Delete all spam comments.
wp comment delete $(wp comment list --status=spam --format=ids)
# Success: Deleted comment 264.
# Success: Deleted comment 262.


# Download WordPress core
wp core download --locale=nl_NL
# Downloading WordPress 4.5.2 (nl_NL)...
# md5 hash verified: c5366d05b521831dd0b29dfc386e56a5
# Success: WordPress downloaded.

# Install WordPress
wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com
# Success: WordPress installed successfully.

# Display the WordPress version
wp core version
# 4.5.2


# Test WP Cron spawning system
wp cron test
# Success: WP-Cron spawning is working as expected.

# Create a new database.
wp db create
# Success: Database created.

# Drop an existing database.
wp db drop --yes
# Success: Database dropped.

# Reset the current database.
wp db reset --yes
# Success: Database reset.

# Execute a SQL query stored in a file.
wp db query < debug.sql

# Make the instance available on any address (with port 8080)
wp server --host=0.0.0.0
# PHP 5.6.9 Development Server started at Tue May 24 01:27:11 2016
# Listening on http://0.0.0.0:8080
# Document root is /
# Press Ctrl-C to quit.

# Run on port 80 (for multisite)
wp server --host=localhost.localdomain --port=80
# PHP 5.6.9 Development Server started at Tue May 24 01:30:06 2016
# Listening on http://localhost1.localdomain1:8080
# Document root is /
# Press Ctrl-C to quit.

# Configure the server with a specific .ini file
wp server --config=development.ini
# PHP 7.0.9 Development Server started at Mon Aug 22 12:09:04 2016
# Listening on http://localhost:8080
# Document root is /
# Press Ctrl-C to quit.


