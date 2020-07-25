#!/bin/zsh

# no spaces before/after the equals
rawdata=$(curl -sk https://www.kernel.org/ | grep -m 1 -A 2 -i 'stable:')
#echo $rawdata

# better way to do this than using echo?
# filter out first line
version_date_html=$( echo $rawdata | sed 1d)
#echo $version_date_html

# Remove html tags with sed
no_html_tags=$( echo $version_date_html | sed 's/<[^>]*>//g')
#echo $no_html_tags

# Take first line as kernel version and second one as release date while 
# removing leading and trailing whitespace with sed
latest_kernel_version=$(echo $no_html_tags | cut -d$'\n' -f1 | sed 's/^[ ^t]*//;s/[ ^]*$//')
echo "Latest stable kernel version: $latest_kernel_version"
release_date=$(echo $no_html_tags | cut -d$'\n' -f2 | sed 's/^[ ^t]*//;s/[ ^]*$//')
echo "Release date: $release_date"

# Now do it in cpp!
