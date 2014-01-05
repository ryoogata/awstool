name             'awstool'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures awstool'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "centos"

# == Recipes
#

recipe "awstool::setup_awscli",
  "Install and setup aws cli tool"

recipe "awstool::setup_backup_file_script",
  "Setup file backup script"

recipe "awstool::setup_backupconf",
  "Setup config for backup"

recipe "awstool::setup_s3cmd",
  "Install and setup s3cmd"

recipe "awstool::setup_s3fs",
  "Install and setup s3fs"

recipe "awstool::setup_swap",
  "Setup Swap"

# == Attributes
#
attribute "awstool",
  :display_name => "General awstool Options",
  :type => "hash"

#attribute "aws/_DEFAULT_REGION",
#  :display_name => "AWS CLI Default Region",
#  :description =>
#    "AWS CLI Default Region",
#  :required => "required",
#  :recipes => [""]
#
#attribute "aws/_ACCESS_KEY",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "aws/_SECRET_KEY",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "s3/_ACCESS_KEY",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "s3/_SECRET_KEY",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "s3/_S3_BUCKETS_NAME",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "backup/_BACKUP_DIRECTORY",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "backup/_BACKUPED_FILE_PREFIX",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
#
#attribute "backup/_BACKUPED_DB_PREFIX",
#  :display_name => "",
#  :description =>
#    "",
#  :required => "",
#  :recipes => [""]
