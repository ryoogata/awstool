name             'awstool'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures awstool'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
depends          'python' 
depends          'git' 

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

recipe "awstool::setup_awscli_pip",
  ""

recipe "awstool::setup_awscli_source",
  ""

recipe "awstool::setup_boto",
  ""

recipe "awstool::setup_boto_pip",
  ""

recipe "awstool::setup_boto_source",
  ""

recipe "awstool::setup_cgroup",
  ""

# == Attributes
#
attribute "awstool",
  :display_name => "General awstool Options",
  :type => "hash"

attribute "aws/_DEFAULT_REGION",
  :display_name => "AWS CLI Default Region",
  :description =>
    "AWS CLI Default Region",
  :choice => ["eu-west-1","sa-east-1","us-east-1","ap-northeast-1","us-west-2","us-west-1","ap-southeast-1","ap-southeast-2"],
  :required => "required",
  :recipes => ["awstool::setup_awscli"]

attribute "aws/_ACCESS_KEY",
  :display_name => "AWS Access Key",
  :description =>
    "AWS Access Key",
  :required => "required",
  :recipes => ["awstool::setup_s3cmd","awstool::setup_s3fs","awstool::setup_awscli"]

attribute "aws/_SECRET_KEY",
  :display_name => "AWS Secret Access Key",
  :description =>
    "AWS Secret Access Key",
  :required => "required",
  :recipes => ["awstool::setup_s3cmd","awstool::setup_s3fs","awstool::setup_awscli"]

attribute "aws/cli/install_method",
  :display_name => "AWS CLI Install Method",
  :description =>
    "AWS CLI Install Method",
  :choice => ["source","pip"],
  :required => "required",
  :recipes => ["awstool::setup_awscli"]

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
