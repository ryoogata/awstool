default["aws"]["_DEFAULT_REGION"] = "us-west-1"
default["aws"]["_ACCESS_KEY"] = ""
default["aws"]["_SECRET_KEY"] = ""
default["aws"]["dynamodb"]["_DYNAMODB_REGION"] = "us-west-1"
default["aws"]["dynamodb"]["_TABLE_NAME"] = "AWSCPUGacha"
default["aws"]["cli"]["install_method"] = "source"
default["aws"]["tag_name"] = ""

default["s3"]["_S3_BUCKETS_NAME"] = ""

default["backup"]["_BACKUP_DIRECTORY"] = "/var, /tmp"
default["backup"]["_BACKUPED_FILE_PREFIX"] = "filebackup"
default["backup"]["_BACKUPED_DB_PREFIX"] = "dbbackup"

default["boto"]["install_method"] = "source"

default["cgroup"]["cpu"]["_CFS_QUOTA_US"] = "250000"
default["cgroup"]["cpu"]["_CFS_PERIOD_US"] = "1000000"
