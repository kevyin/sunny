find . -type d -print0 | xargs -0 du -s | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}
