#La Prensa - AFT Content Syncronization#

##afp.py##

This script proccess the NewsML Documents and post the news information on La Prensa Web Site. Example of use:

    python afp.py /absolute/path/to/data

##sync.sh##

Put all JPG files on the AFP data directory to the S3. Requires s3cmd and S3 configuraton file. Exmple of use:

    ./sync.sh

##settings.py##

Include some parameters used by both scripts the S3 destination, local data directories and database
