parser grammar dokuwikiParser;

options { tokenVocab=dokuwikiLexer; }
//import urlParser;


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
element: bold element | italic element | newline element | paragraph element | underline element | subscript element | superscript element | deleted element | link element | media element | quote element | code element | header element | newline element ;
document: element+? ;
