#!/usr/bin/env bash


#export SSL__SUBJ__C="Country"
#export SSL__SUBJ__ST="State"
#export SSL__SUBJ__L="City"
#export SSL__SUBJ__O="Company"
#export SSL__SUBJ__OU="Division"
#export SSL__SUBJ__CN="www.example.com"
#export SSL__SUBJ__subjectAltName="DNS:www.example.com"
#export SSL__SUBJ__emailAddress="nobody@www.example.com"


# Normalize working directory
cd "$(dirname "$0")"

if [ "$1" == "-root" ]
then ./scripts/generate-cert-root.sh
else ./scripts/generate-cert.sh
fi
