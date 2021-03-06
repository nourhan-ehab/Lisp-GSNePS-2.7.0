;;; -*- Mode: Lisp; Syntax: Common-Lisp; Package: SNIP; Base: 10 -*-

;; Copyright (C) 1993--2007
;; Research Foundation of State University of New York

;; Version: $Id: do-if.lisp,v 1.3 2007/08/21 01:54:39 mwk3 Exp $

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


(in-package :snip)


;  DO-IF functions
;
(defun rule-handler.do-if (ant-act cqch)
  (let ((sensory-act (choose.ns (makeone.ns
				 (match::applysubst (choose.ns ant-act)
						    (filter.ch cqch)))))
	pr)
    (remark `"~%Since" (makeone.ns *NODE*) nil)
    (remark `"~%I will perform" (makeone.ns sensory-act) nil)
    (activate.n sensory-act)
    (setq pr (activation.n sensory-act))
    (regstore pr '*PRIORITY* 'INTEND)
    (regstore pr '*AGENDA* 'START)
    (multi:schedule pr multi::*act-queue*)
    t))

;
; =============================================================================
;

(defun usability-test.do-if (sign)
  (declare (special *NODE*))
  (and (eq sign 'POS)
       (or (isnew.ns (quantified-vars.n *NODE*))
           (not (isnew.ns (nodeset.n *NODE* 'sneps::forall))))))


;
;
; =============================================================================





    
    




