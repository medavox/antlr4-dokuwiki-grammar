grammar dokuwiki;

import url;
//Parser rules

paragraph: (CHARACTER | SPACE)+ ;
bold: BOLD paragraph BOLD ;
italic:	ITALIC paragraph ITALIC ;
underline: UNDERLINE paragraph UNDERLINE ;
subscript: SUBSCRIPT_OPEN paragraph SUBSCRIPT_CLOSE ;
superscript: SUPERSCRIPT_OPEN paragraph SUPERSCRIPT_CLOSE ;
deleted: DELETED_OPEN paragraph DELETED_CLOSE ;
newline: LINEBREAK ;
link: LINK_OPEN url COMBINE paragraph LINK_CLOSE ;
media: MEDIA_OPEN url MEDIA_CLOSE ;
footnote: FOOTNOTE_OPEN paragraph FOOTNOTE_CLOSE ;
header:	HEADLINE_1 paragraph HEADLINE_1 | HEADLINE_2 paragraph HEADLINE_2 | HEADLINE_3 paragraph HEADLINE_3 | HEADLINE_4 paragraph HEADLINE_4 | HEADLINE_5 paragraph HEADLINE_5 ;
quote: QUOTE paragraph ;
code: CODE_OPEN paragraph CODE_CLOSE ;
body_part: bold body_part | italic body_part | newline body_part | paragraph body_part | underline body_part | subscript body_part | superscript body_part | deleted body_part | link body_part | media body_part | quote body_part | code body_part | header body_part | newline body_part ;
body: body_part+? ;

//Lexer rules

SPACE: ' ' | '\t' | [\u00A0]  ;
CHARACTER: [!$#"%&*+,\-./:;?@^_`()~] |  '0'..'9' | 'A'..'Z'  | 'a'..'z' | '\'' | '<' | '[' | ']'  ;
BOLD: '**' ;
ITALIC: '//' ;
UNDERLINE: '__' ;
MONOSPACE: '\'\'' ;
SUBSCRIPT_OPEN:	'<sub>' ;
SUBSCRIPT_CLOSE: '</sub>' ;
SUPERSCRIPT_OPEN: '<sup>' ;
SUPERSCRIPT_CLOSE: '</sup>' ;
DELETED_OPEN: '<del>' ;
DELETED_CLOSE:	'</del>' ;
LINEBREAK:  '\\' | '\r'?'\n' | '\r' ;
LINK_OPEN: '[[' ;
LINK_CLOSE: ']]' ;
MEDIA_OPEN:	'{{' ;
MEDIA_CLOSE: '}}' ;
FOOTNOTE_OPEN: '((' ;
FOOTNOTE_CLOSE:	'))' ;
HEADLINE_1:	'======' ;
HEADLINE_2:	'=====' ;
HEADLINE_3:	'====' ;
HEADLINE_4:	'===' ;
HEADLINE_5:	'==' ;
UNORDERED_LIST: '  * ' ;
ORDERED_LIST: '  - ' ;
QUOTE: '>' ;
CODE_OPEN: '<code>' | '<file>' ;
CODE_CLOSE:	'</code>' | '</file>' ;
NOWIKI_OPEN: '<nowiki>' ;
NOWIKI_CLOSE: '</nowiki>' ;
COMBINE: '|' ;
WHITESPACE:	[\t\r\n]+ -> skip ;
