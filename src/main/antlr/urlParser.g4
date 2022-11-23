/*
BSD License

Copyright (c) 2016, Tom Everett
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of Tom Everett nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/**
* scheme:[//[user:password@]host[:port]][/]path[?query][#fragment]
*/
parser grammar urlParser;
options { tokenVocab=urlLexer; }

url
   : uri EOF
   ;

uri
   : scheme PROTOCOL login? host (COLON port)? (SLASH path?)? query? frag? WS?
   ;

scheme
   : string
   ;

host
   : SLASH? hostname
   ;

hostname
   : string (FULL_STOP string)*   #DomainNameOrIPv4Host
   | OPEN_SQUARE_BRACKET v6host CLOSE_SQUARE_BRACKET         #IPv6Host
   ;

v6host
   : DOUBLE_COLON? (string | DIGITS) ((COLON|DOUBLE_COLON) (string | DIGITS))*
   ;

port
   : DIGITS
   ;

path
   : string (SLASH string)* SLASH?
   ;

user
   : string
   ;

login
   : user (COLON password)? AT
   ;

password
   : string
   ;

frag
   : HASH (string | DIGITS)
   ;

query
   : QUESTION_MARK search
   ;

search
   : searchparameter (AMPERSAND searchparameter)*
   ;

searchparameter
   : string (EQUALS (string | DIGITS | HEX))?
   ;

string
   : STRING
   | DIGITS
   ;
