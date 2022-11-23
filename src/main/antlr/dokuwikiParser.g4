parser grammar dokuwikiParser;

options { tokenVocab=dokuwikiLexer; }
//import urlParser;


//bold: BOLD element BOLD ;
//italic:	ITALIC element ITALIC ;
//underline: UNDERLINE element UNDERLINE ;
//subscript: SUBSCRIPT_OPEN element SUBSCRIPT_CLOSE ;
//superscript: SUPERSCRIPT_OPEN element SUPERSCRIPT_CLOSE ;
//deleted: DELETED_OPEN element DELETED_CLOSE ;
//newline: LINEBREAK ;
//link: LINK_OPEN text PIPE element LINK_CLOSE ;
//interwikiLink: LINK_OPEN text GT element LINK_CLOSE ;
//media: MEDIA_OPEN text MEDIA_CLOSE ;
//footnote: FOOTNOTE_OPEN element FOOTNOTE_CLOSE ;
//quote: GT element ;
//code: CODE_OPEN element CODE_CLOSE ;
text : TEXT+ ;
h1 : H1 element H1 ;
//h2 : H2 element H2 ;
//h3 : H3 element H3 ;
//h4 : H4 element H4 ;
//h5 : H5 element H5 ;
//header
    //: h1 .+? h1
    //| HEADLINE_2 .+? HEADLINE_2
    //| HEADLINE_3 OWT+? HEADLINE_3
    //| HEADLINE_4 OWT+? HEADLINE_4
    //| HEADLINE_5 OWT+? HEADLINE_5
    //;


element 
//    : bold
//    | code
//    | deleted
//    | h1
//    | italic
//    | link
//    | media
//    | newline
//    | quote
//    | subscript
//    | superscript
//    | underline
//    | footnote
//    | interwikiLink
//    | text
//    ;
: (h1 | text)+ ;

document: element+? EOF ;
//paragraph : OWT+? ;
