;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: USER; Base: 10 -*-

;; Copyright (C) 1984--2007
;; Research Foundation of State University of New York

;; Version: $Id: system.lisp,v 1.6 2007/10/05 17:27:45 mwk3 Exp $

;; This file is part of SNePS.

;; $BEGIN LICENSE$

;; 
;; The contents of this file are subject to the University at
;; Buffalo Public License Version 1.0 (the "License"); you may
;; not use this file except in compliance with the License. You
;; may obtain a copy of the License at http://www.cse.buffalo.
;; edu/sneps/Downloads/ubpl.pdf.
;; 
;; Software distributed under the License is distributed on an
;; "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
;; or implied. See the License for the specific language gov
;; erning rights and limitations under the License.
;; 
;; The Original Code is SNePS 2.7.
;; 
;; The Initial Developer of the Original Code is Research Foun
;; dation of State University of New York, on behalf of Univer
;; sity at Buffalo.
;; 
;; Portions created by the Initial Developer are Copyright (C)
;; 2007 Research Foundation of State University of New York, on
;; behalf of University at Buffalo. All Rights Reserved.
;; 
;;  
;; 
;; 


;; $END LICENSE$


(in-package :user)


;; This variable defines a compile/load sequence for
;; the SNePS system. It was derived from the
;; compile/load sequence generated by the system
;; definition for SNePS available on the TI-Explorers.
;; Each entry consists of an action, and a logical pathname.

(defvar *sneps-system-definition*

  `((:LOAD "sneps:packages")
    (:LOAD "sneps:sneps;exports")	  
    (:LOAD "sneps:snebr;exports")
    (:LOAD "sneps:snip;exports")
    (:LOAD "sneps:match;exports")
    (:LOAD "sneps:multi;exports")
    (:LOAD "sneps:snepslog;exports")
    ;; Removing xginseng and ginseng
    ;;(:LOAD "sneps:xginseng;exports")
		  
    (:LOAD "sneps:nlint;englex;exports")
		  
    (:LOAD "sneps:sneps;imports")
    (:LOAD "sneps:match;imports")
    (:LOAD "sneps:multi;imports")
    (:LOAD "sneps:snip;imports")
    (:LOAD "sneps:snebr;imports")
    (:LOAD "sneps:nlint;englex;imports")
    ;; This has to be in reverse order because S
    ;; gets reexported from parser.
    (:LOAD "sneps:nlint;parser;imports")
    (:LOAD "sneps:nlint;parser;exports")
    (:LOAD "sneps:snepslog;imports")
		  
    (:COMPILE-LOAD "sneps:sneps;ds;context0")
    (:COMPILE-LOAD "sneps:sneps;ds;node0")
    (:COMPILE-LOAD "sneps:sneps;ds;contextset")
    (:COMPILE-LOAD "sneps:sneps;ds;otag")
    (:COMPILE-LOAD "sneps:sneps;ds;file")
    (:COMPILE-LOAD "sneps:sneps;ds;nodeset")
    (:COMPILE-LOAD "sneps:sneps;ds;rel1")
    (:COMPILE-LOAD "sneps:sneps;ds;util")
    (:COMPILE-LOAD "sneps:sneps;ds;svar")
    (:COMPILE-LOAD "sneps:sneps;ds;command")
    (:COMPILE-LOAD "sneps:sneps;ds;context2")
    (:COMPILE-LOAD "sneps:sneps;ds;svarset")
    (:COMPILE-LOAD "sneps:sneps;ds;ctcableset")
    (:COMPILE-LOAD "sneps:sneps;ds;snd")
    (:COMPILE-LOAD "sneps:sneps;ds;cable")
    (:COMPILE-LOAD "sneps:sneps;ds;relset")
    (:COMPILE-LOAD "sneps:sneps;ds;rel2")
    (:COMPILE-LOAD "sneps:sneps;ds;var")
    (:COMPILE-LOAD "sneps:sneps;ds;context3")
    (:COMPILE-LOAD "sneps:sneps;ds;node2")
    (:COMPILE-LOAD "sneps:sneps;ds;bind")
    (:COMPILE-LOAD "sneps:sneps;ds;nodeset2")
    (:COMPILE-LOAD "sneps:sneps;ds;fcableset")
    (:COMPILE-LOAD "sneps:sneps;ds;context1")
    (:COMPILE-LOAD "sneps:sneps;ds;cableset")
    (:COMPILE-LOAD "sneps:sneps;ds;bindset")
    (:COMPILE-LOAD "sneps:sneps;ds;nodebind")
    (:COMPILE-LOAD "sneps:sneps;ds;node1")
    (:COMPILE-LOAD "sneps:sneps;ds;nbindset")
    (:COMPILE-LOAD "sneps:sneps;ds;transform")
    (:COMPILE-LOAD "sneps:sneps;ds;path")
    (:COMPILE-LOAD "sneps:snip;ds;support")
    (:COMPILE-LOAD "sneps:sneps;fns;command")
    (:COMPILE-LOAD "sneps:sneps;fns;io-utils")
    (:COMPILE-LOAD "sneps:sneps;fns;restr")
    (:COMPILE-LOAD "sneps:sneps;fns;updatect")
    (:COMPILE-LOAD "sneps:sneps;fns;tconc")
    (:COMPILE-LOAD "sneps:sneps;fns;svfns")
    (:COMPILE-LOAD "sneps:sneps;fns;relfns")
    (:COMPILE-LOAD "sneps:sneps;fns;outnet")
    (:COMPILE      "sneps:sneps;fns;oinnet")
    (:COMPILE-LOAD "sneps:sneps;fns;innet")
    (:COMPILE-LOAD "sneps:sneps;fns;findfilter")
    (:COMPILE-LOAD "sneps:sneps;fns;findhelp")
    (:COMPILE-LOAD "sneps:sneps;fns;erase")
    (:COMPILE-LOAD "sneps:sneps;fns;infixfns")
    (:COMPILE-LOAD "sneps:sneps;fns;dd")
    (:COMPILE-LOAD "sneps:sneps;fns;buildfns")
    (:COMPILE-LOAD "sneps:sneps;fns;find")
    (:COMPILE-LOAD "sneps:sneps;fns;read")
    (:COMPILE-LOAD "sneps:sneps;fns;findexact")
    (:COMPILE-LOAD "sneps:sneps;fns;hyp")
    (:COMPILE-LOAD "sneps:sneps;fns;path")
    (:COMPILE-LOAD "sneps:sneps;fns;demo-tool")
    (:COMPILE-LOAD "sneps:sneps;fns;intext")
    (:LOAD         "sneps:demo;demo-info")
    (:COMPILE-LOAD "sneps:sneps;fns;demo")
    (:COMPILE-LOAD "sneps:sneps;fns;snepstop")
    (:COMPILE-LOAD "sneps:sneps;fns;with-snepsul")
    (:COMPILE-LOAD "sneps:sneps;fns;dbms")
    (:COMPILE-LOAD "sneps:match;ds;setnorm")
    (:COMPILE-LOAD "sneps:match;ds;supmatching")
    (:COMPILE-LOAD "sneps:match;ds;matching")
    (:COMPILE-LOAD "sneps:match;ds;mbind")
    (:COMPILE-LOAD "sneps:match;ds;substitution")
    (:COMPILE-LOAD "sneps:match;ds;matchingset")
    (:COMPILE-LOAD "sneps:match;ds;supmatchingset")
    (:COMPILE-LOAD "sneps:match;fns;compute-support")
    (:COMPILE-LOAD "sneps:match;fns;match")
    (:COMPILE-LOAD "sneps:multi;ds;dequeue")
    (:COMPILE-LOAD "sneps:multi;ds;valve")
    (:COMPILE-LOAD "sneps:snip;fns;sched")
    (:COMPILE-LOAD "sneps:multi;fns;multi")
    (:COMPILE-LOAD "sneps:snip;ds;ich")
    (:COMPILE-LOAD "sneps:snip;ds;switch")
    (:COMPILE-LOAD "sneps:snip;ds;sign")
    (:COMPILE-LOAD "sneps:snip;ds;filter")
    (:COMPILE-LOAD "sneps:snip;ds;cqch")
    (:COMPILE-LOAD "sneps:snip;ds;restriction")
    (:COMPILE-LOAD "sneps:snip;ds;destination")
    (:COMPILE-LOAD "sneps:snip;ds;feeder")
    (:COMPILE-LOAD "sneps:snip;ds;channel")
    (:COMPILE-LOAD "sneps:snip;ds;report")
    (:COMPILE-LOAD "sneps:snip;ds;instance")
    (:COMPILE-LOAD "sneps:snip;ds;fnode")
    (:COMPILE-LOAD "sneps:snip;ds;repset")
    (:COMPILE-LOAD "sneps:snip;ds;freport")
    ;(:COMPILE-LOAD "sneps:snip;ds;gsupport")  ; added nea 7/15
    (:COMPILE-LOAD "sneps:snip;ds;iset")
    (:COMPILE-LOAD "sneps:snip;ds;fnodeset")
    (:COMPILE-LOAD "sneps:snip;ds;feederset")
    (:COMPILE-LOAD "sneps:snip;ds;ichset")
    (:COMPILE-LOAD "sneps:snip;ds;cqchset")
    (:COMPILE-LOAD "sneps:snip;ds;chset")
    (:COMPILE-LOAD "sneps:snip;ds;request")
    (:COMPILE-LOAD "sneps:snip;ds;frepset")
    (:COMPILE-LOAD "sneps:snip;ds;rui")
    (:COMPILE-LOAD "sneps:snip;ds;ruiset")
    (:COMPILE-LOAD "sneps:snip;ds;ptree")
    (:COMPILE-LOAD "sneps:snip;fns;icontext")
    (:COMPILE-LOAD "sneps:snip;fns;user")
    (:COMPILE-LOAD "sneps:snip;fns;rule")
    (:COMPILE-LOAD "sneps:snip;fns;transformers")
    (:COMPILE-LOAD "sneps:snip;fns;remark")
    (:COMPILE-LOAD "sneps:snip;fns;thresh")
    (:COMPILE-LOAD "sneps:snip;fns;num-ent")
    (:COMPILE-LOAD "sneps:snip;fns;rule-eintr")
    (:COMPILE-LOAD "sneps:snip;fns;nrn-reports")
    (:COMPILE-LOAD "sneps:snip;fns;resource-lim")
    (:COMPILE-LOAD "sneps:snip;fns;non-rule")
    (:COMPILE-LOAD "sneps:snip;fns;rule-finfers")
    (:COMPILE-LOAD "sneps:snip;fns;make")
    (:COMPILE-LOAD "sneps:snip;fns;filterhelp")
    (:COMPILE-LOAD "sneps:snip;fns;deduce")
    (:COMPILE-LOAD "sneps:snip;fns;deducetrue")    
    (:COMPILE-LOAD "sneps:snip;fns;and-or")
    (:COMPILE-LOAD "sneps:snip;fns;and-ent")
    (:COMPILE-LOAD "sneps:snip;fns;num-quant-rule")
    (:COMPILE-LOAD "sneps:snip;fns;num-quant")
    (:COMPILE-LOAD "sneps:snip;fns;add")
    (:COMPILE-LOAD "sneps:snip;fns;support")
    (:COMPILE-LOAD "sneps:snip;fns;rule-reports")
    (:COMPILE-LOAD "sneps:snip;fns;rule-requests")
    (:COMPILE-LOAD "sneps:snip;fns;nrn-requests")
    (:COMPILE-LOAD "sneps:snip;fns;nrn-finfers")
    (:COMPILE-LOAD "sneps:snip;fns;rule-bintr")
    (:COMPILE-LOAD "sneps:snip;fns;message")
    (:COMPILE-LOAD "sneps:snip;fns;or-ent")
    (:COMPILE-LOAD "sneps:snip;fns;nor")
    (:COMPILE-LOAD "sneps:snip;fns;and")
    
    (:COMPILE-LOAD "sneps:snip;ds;act-utils")
    (:COMPILE-LOAD "sneps:snip;fns;plantrace")
    (:COMPILE-LOAD "sneps:snip;fns;act")
    (:COMPILE-LOAD "sneps:snip;fns;dynamic-add")
    (:COMPILE-LOAD "sneps:snip;fns;mental-acts")
    (:COMPILE-LOAD "sneps:snip;fns;snsequence")
    (:COMPILE-LOAD "sneps:snip;fns;snif")
    (:COMPILE-LOAD "sneps:snip;fns;sniterate")
    (:COMPILE-LOAD "sneps:snip;fns;do-one")
    (:COMPILE-LOAD "sneps:snip;fns;do-all")
    (:COMPILE-LOAD "sneps:snip;fns;achieve")
    (:COMPILE-LOAD "sneps:snip;fns;with-acts")
    (:COMPILE-LOAD "sneps:snip;fns;do-if")
    (:COMPILE-LOAD "sneps:snip;fns;when-do")
    (:COMPILE-LOAD "sneps:snip;fns;whenever-do") ;added 3/31/99 --hi
    (:COMPILE-LOAD "sneps:snip;fns;perform")

    (:COMPILE-LOAD "sneps:snebr;contrad")
    (:COMPILE-LOAD "sneps:snebr;snepshandler")
    (:COMPILE-LOAD "sneps:snebr;sniphandler")
		  
    (:COMPILE-LOAD "sneps:snepslog;parser;parser")
    (:COMPILE-LOAD "sneps:snepslog;parser;snepslog-parser")
    (:COMPILE-LOAD "sneps:snepslog;generator;generator")
    (:SNEPSLOG-ATNIN
     "sneps:snepslog;generator;generator.atn")
    (:COMPILE-LOAD "sneps:snepslog;printer")
    (:COMPILE-LOAD "sneps:snepslog;reader")
    (:COMPILE-LOAD "sneps:snepslog;snepslog")
    (:COMPILE-LOAD "sneps:snepslog;toplevel")
    
    ;; Stu Shapiro's tell ask interface added 4/6/1998 --aec
    (:COMPILE-LOAD "sneps:snepslog;tellask")
    
    ;;; Stu's sneps/snepslog load function added 1/25/07 --mwk
    (:COMPILE-LOAD "sneps:sneps;fns;load")

    ;;Added 5/8/98 by HI.
    ;; Removed ".CL" after changing source file to .lisp  (FLJ 8/1/04)
    (:COMPILE-LOAD "sneps:snepslog;mode3")

    ;; JavaSnepsAPI - Added 8/14/07 by mwk3
    #+allegro
    (:COMPILE-LOAD "sneps:JavaSnepsAPI;java-sneps-api")

    ;; Make sure both versions get compiled, but only
    ;; load what the users wants to be loaded. 
    (:COMPILE "sneps:nlint;englex;englex")
    (:COMPILE "sneps:nlint;englex;lenglex")
    ;,@(cond
	;(*sneps-load-old-englex*
	; '((:LOAD "sneps:nlint;englex;englex")))
	;(t '((:LOAD "sneps:nlint;englex;lenglex"))))

    (:COMPILE-LOAD "sneps:nlint;englex;verbthread")
    (:COMPILE-LOAD "sneps:nlint;englex;wordize")
    (:COMPILE-LOAD "sneps:nlint;parser;parser")

    ;;(:COMPILE-LOAD "sneps:xginseng;toplevel")

;;#+explorer
;;    ,@'((:COMPILE-LOAD "sneps:ginseng;variables")
;;	(:COMPILE-LOAD "sneps:ginseng;display")
;;	(:COMPILE-LOAD "sneps:ginseng;node")
;;	(:COMPILE-LOAD "sneps:ginseng;ds")
;;	(:COMPILE-LOAD "sneps:ginseng;shownode")
;;	(:COMPILE-LOAD "sneps:ginseng;pan")
;;	(:COMPILE-LOAD "sneps:ginseng;move")
;;	(:COMPILE-LOAD "sneps:ginseng;ds1")
;;	(:COMPILE-LOAD "sneps:ginseng;dump")
;;	(:COMPILE-LOAD "sneps:ginseng;desc"))
    ))

(make-simple-system "SNePS" *sneps-system-definition*
		    :mode *sneps-make-option*
		    :verbose *load-verbose*)



    
    




