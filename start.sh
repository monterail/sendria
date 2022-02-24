#!/bin/sh
set -euo pipefail

# generate htpasswd based on SENDRIA_ env variables
python - <<-EOF
from passlib.apache import HtpasswdFile
import os
ht=HtpasswdFile('auth.htpasswd', new=True, default_scheme='bcrypt')
ht.set_password(os.environ['SENDRIA_USER'], os.environ['SENDRIA_PASS'])
ht.save()
EOF

sendria --foreground --no-quit --db=./data/mails.sqlite \
  --smtp-ip=0.0.0.0 --smtp-auth=auth.htpasswd \
  --http-ip=0.0.0.0 --http-auth=auth.htpasswd \
