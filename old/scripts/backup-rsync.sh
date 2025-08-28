#!/bin/sh
# backup-rsync.sh
# backup home directory
# author: Yann
# ref: https://cbll.cs.nyu.edu/internal/doku.php?id=scripts

# directory to backup
DIR=roy

# parent of directory to backup
PARENT=/home

# directory where backups are written
BKPDIR=/media/backup/backup-rsync

# subdirectory of BKPDIR where last backup was performed (last date)
LAST=`ls -1t $BKPDIR | head -1`

# subdirectory of BKPDIR where current back is to be performed (current date)
CURT=`date +%Y%m%d`
mkdir $BKPDIR/$CURT

# original script allows some directories to be excluded
cd $PARENT
sudo rsync -av --delete --link-dest=$BKPDIR/$LAST $DIR $BKPDIR/$CURT
# -a          archive mode
# -v          verbose
# --delete    delete extraneous files from dest dirs
# --link-dest hardlink to files in DIR when unchanged