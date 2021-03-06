;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: SNEPS; Base: 10 -*-

;; Copyright (C) 1984--2007 Research Foundation of 
;;                          State University of New York

;; Version: $Id: findexact.lisp,v 1.3 2007/08/21 01:54:29 mwk3 Exp $

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


(in-package :sneps)


; =============================================================================
;
; count-wires
; -----------
;
;       arguments     : cs - <cable set>
;
;       returns       : <non negative integer>
;
;       description   : returns the number of wires in "cs"
;
;                                        written :  rgh  3/24/86
;                                        modified:
;
;
(defmacro count-wires (cs)
  `(let ((count 0))
    (do.cs (c ,cs count)
     (incf count (cardinality.ns (nodeset.c c))))))
;
;
; =============================================================================
;
; exactfilter
; -----------
;
;       arguments     : ns - <node set>
;                       wirecount - <non negative integer>
;
;       returns       : <node set>
;
;       description   : returns a <node set> consisting of all those nodes
;                       in "ns" which have have exactly "wirecount" number
;                       of wires in their down-cable set
;
;                                        written :  rgh  3/24/86
;                                        modified:  ssc  2/06/89
;                                                   ssc  5/10/89
;
;
(Defmacro exactfilter (fcs ns wirecount)
  `(do.ns (n ,ns nil)
     (when (and (lisp::= ,wirecount (count-wires (n-to-downcs n)))
		(iseq.fcs ,fcs (down.fcs n)))
       (return (makeone.ns n)))))
;
;
; =============================================================================
;
; superfilter
; -----------
;
;       arguments     : ns - <node set>
;                       wirecount - <non negative integer>
;
;       returns       : <node set>
;
;       description   : returns a <node set> consisting of all those nodes
;                       in "ns" which have have greater or equal "wirecount" number
;                       of wires in their down-cable set
;
;       modification  : Use (gensym) to generate local result variable to avoid name clashes
;                       (the name 'result' is used as a special variable quite a few times)
;
;                                        written :  ssc 02/02/89
;                                        modified:  hc  04/18/89
;                                                   ssc  5/10/89
;
;
					;

(defun superfilter (ns wirecount)
  "Returns a <node set> consisting of all those nodes
       in ns which have have greater or equal wirecount number
       of wires in their down-cable set"
  ;; Assumes that ns is represented by a sequence.
  (remove-if #'(lambda (n) (< (count-wires (n-to-downcs n)) wirecount))
	     ns))


;
;
; =============================================================================
;
; exactcheckconsts
; ----------------
;
;       arguments     : cs - <cable set>
;                       wirecount - <non negative integer>
;
;       returns       : <boolean>
;
;       nonlocal-vars : result - <node set> : defined in findexact1
;
;       description   : another helper function to findexact - see findexact
;                       and findexact1 for description.
;
;       side-effects  : updates the value of "result"
;
;                                        written :  rgh  3/24/86
;                                        modified:  rgh  3/24/86
;                                                   ssc  2/02/89
;                                                   ssc  5/10/89
;
;
(defmacro exactcheckconsts (cs result)
  `(let ((result1 ,result))
     (do.cs (c ,cs result1)
       (cond ((isnew.ns result1) (return result1))
	     (t (setq result1
		      (intersect.ns
			(let* ((relform (relation.c c))
			       (pathform (if (is.p relform)
					     relform
					     (rel-to-path relform)))
			       (nsform (nodeset.c c)))
			  (cond ((lisp:= (length pathform) 1)
				 (rel-to relform nsform))
				(t (nbs-to-ns (pathto pathform
						      (ns-to-nbs nsform))))))
			result1)))))))
;
;
;
; =============================================================================
;
; findexact
; ---------
;
;       arguments     : cs - <cable set>
;
;       returns       : <node set>
;
;       description   : Tries to find a node in the network which has exactly
;                       the cables is "cs".  If such a node is found, it is
;                       returned (as a singleton node set), otherwise a new
;                       <node set> is returned.
;
;       implementation: Tries to find such a node, in a manner similar to
;                       the more general function "find", and then compares
;                       the numbers of wires descending from the node to see
;                       if the match is exact.  Calculates the number of
;                       wires in "cs" and passes that, along with "cs" to
;                       the helper function findexact1.
;
;                                        written :  rgh  3/19/86
;                                        modified:
;
;
(defun findexact (cs)
   (findexact1 cs (count-wires cs)))
;
;
; =============================================================================
;
; findexact1
; ----------
;
;       arguments     : cs - <cable set>
;                       wirecount - <non negative integer>
;
;       returns       : <node set>
;
;       description   : helper function for findexact - see findexact for
;                       description
;
;       implementation: the variable "result" is side-effected by the call
;                       to exactcheckconsts.  Finexact1 tests the first
;                       cable in "cs" and then calls exactcheckconsts to
;                       test the rest.
;
;                                        written :  rgh  3/24/86
;                                        modified:  scs  6/22/87
;                                                   ssc  2/02/89
;                                                   ssc  5/10/89 
;                                                   ssc  5/12/89
;
;
(defun findexact1 (cs wirecount)
  (let* ((superset (unless (isnew.cs cs)
		     (exactcheckconsts (others.cs cs)
				       (superfilter				 
					 (let* ((relform (relation.c (choose.cs cs)))
						(pathform (if (is.p relform)
							      relform
							      (rel-to-path relform)))
						(nsform (nodeset.c (choose.cs cs))))
					   (cond ((lisp:= (length pathform) 1)
						  (rel-to relform nsform))
						 (t (nbs-to-ns
						      (pathto pathform
							      (ns-to-nbs nsform))))))
					 wirecount))))
	 (exactset (exactfilter (cs-to-fcs cs) superset wirecount)))
    exactset))
    ;;
    ;; This was the old code in SNePS 2.0.
    ;; It seems that (exist-assertion.ns superset) should be (has-support .....)
    ;;
;    (cond ((and (isnew.ns exactset)(exist-assertion.ns superset)) '(t))
;	  (t exactset))))

;
;
; =============================================================================
;
; rel-to1
; -------
;
;       arguments     : r - <relation>
;                       ns - <node set>
;
;       returns       : <node set>
;
;       description   : Helper function of "Rel-To".  Finds all the nodes which have
;                       the relation "r" going to them from every node in "ns"
;
;                                        written :  rgh  3/24/86
;                                        modified: scs  6/22/87
;                                                  ssc  5/10/89
;
;
(defmacro rel-to1 (r ns)
  `(unless (isnew.ns ,ns)
     (let ((result (nodeset.n (choose.ns ns) ,r)))
       (do.ns (n (others.ns ,ns) result)
	 (when (null
		 (setq result (intersect.ns (nodeset.n n ,r) result)))
	   (return nil))))))
;
;
; =============================================================================
;
; rel-to
; ------
;
;       arguments     : r - <relation>
;                       ns - <node set>
;
;       returns       : <node set>
;
;       description   : finds all nodes which have the relation "r" to any
;                       node in "ns"
;
;                                        written :  rgh  3/24/86
;                                        modified:
;
;
(defun rel-to (r ns)
   (cond ((isnew.ns ns) ns)
         (t (rel-to1 (converse.r r) ns))))
;
;
; =============================================================================


(defun find-negate (n)
  "Returns the node that is the negation of node n,
      if such negation node is in the network; 
    else returns nil.
    Uses canonicalcs."
  (let ((0node (node 'snepsul::\0)))
    (when 0node
      (let ((ccs (canonicalcs
		  (putin.cs
		   (new.c 'min (makeone.ns 0node))
		   (putin.cs
		    (new.c 'max (makeone.ns 0node))
		    (putin.cs (new.c 'arg (makeone.ns n)) (new.cs)))))))
	(choose.ns
	 (findexact1 ccs (count-wires ccs)))))))

    
    




