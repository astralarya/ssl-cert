#!/usr/bin/env bash

SSL__DIR="${SSL__DIR-"$HOME/.ssl"}"
SSL__CA__CRT="${SSL__CA__CRT-"root-selfsigned.crt"}"
SSL__CA__KEY="${SSL__CA__KEY-"root-selfsigned.key"}"
SSL__CA__DAYS="${SSL__CA__DAYS-"8192"}"


# Check that SSL Subject is well formed
if [ -z "$SSL__SUBJ__C" ]; then 
    echo 'SSL Subject: Country is undefined (`$SSL__SUBJ__C`)'
    error=1
fi
if [ -z "$SSL__SUBJ__ST" ]; then 
    echo 'SSL Subject: State is undefined (`$SSL__SUBJ__ST`)'
    error=1
fi
if [ -z "$SSL__SUBJ__L" ]; then 
    echo 'SSL Subject: Locality is undefined (`$SSL__SUBJ__L`)'
    error=1
fi
if [ -z "$SSL__SUBJ__O" ]; then 
    echo 'SSL Subject: Organization is undefined (`$SSL__SUBJ__O`)'
    error=1
fi
if [ -z "$SSL__SUBJ__OU" ]; then 
    echo 'SSL Subject: Organizational Unit is undefined (`$SSL__SUBJ__OU`)'
    error=1
fi
if [ -z "$SSL__SUBJ__CN" ]; then 
    echo 'SSL Subject: Common Name is undefined (`$SSL__SUBJ__CN`)'
    error=1
fi
if [ -z "$SSL__SUBJ__subjectAltName" ]; then 
    echo 'SSL Subject: Subject Alt Name is undefined (`$SSL__SUBJ__subjectAltName`)'
    error=1
fi
if [ -z "$SSL__SUBJ__emailAddress" ]; then 
    echo 'SSL Subject: Email Address is undefined (`$SSL__SUBJ__emailAddress`)'
    error=1
fi

# Create directories if needed
if [ ! -d "$SSL__DIR" ]; then
    mkdir -p "$SSL__DIR" && \
    chmod -R 700 "$SSL__DIR" || \
    error=1
fi
if [ ! -d "$SSL__DIR/crt" ]; then
    mkdir -p "$SSL__DIR/crt" && \
    chmod -R 700 "$SSL__DIR/crt" || \
    error=1
fi
if [ ! -d "$SSL__DIR/csr" ]; then
    mkdir -p "$SSL__DIR/csr" && \
    chmod -R 700 "$SSL__DIR/csr" || \
    error=1
fi
if [ ! -d "$SSL__DIR/key" ]; then
    mkdir -p "$SSL__DIR/key" && \
    chmod -R 700 "$SSL__DIR/key" || \
    error=1
fi

# Exit if $error set
if [ ! -z ${error+x} ]; then
    exit 1
fi


openssl req -x509 -nodes -days "$SSL__CA__DAYS" -newkey rsa:4096 \
    -out "$SSL__DIR/crt/$SSL__CA__CRT" \
    -keyout "$SSL__DIR/key/$SSL__CA__KEY" \
    -subj "/C=$SSL__SUBJ__C/ST=$SSL__SUBJ__ST/L=$SSL__SUBJ__L/O=$SSL__SUBJ__O/OU=$SSL__SUBJ__OU/CN=$SSL__SUBJ__CN/emailAddress=$SSL__SUBJ__emailAddress"
