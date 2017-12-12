; This is a simple Lisp reasoning expert system
; In order to run the application call the start function as follows:
; (start)
; Then respond to the questions asked with either y or n
; Example: 
; Does the language use logograms? (y or n) n


; variables for storing information whether a question has been asked already
(defvar engine)

; macro used for bulk variable definitions
(defmacro bulk-define (vars)
  `(progn
     ,@(loop for var in vars
             collect `(defvar ,var)
		)
	)
)

; macro used for bulk initialization
(defmacro bulk-init (vars)
  `(progn
     ,@(loop for var in vars
             collect `(setq ,var NIL)
		)
	)
)

; recursive macro used for bulk variable definitions
(defmacro bulk-define-rec(vars)
	(if (car vars)
		`(progn
			(defvar ,(car vars) NIL) 
			(bulk-define-rec ,(cdr vars))
		)
	)
)

; recursive macro used for bulk initialization
(defmacro bulk-init-rec(vars)
	(if (car vars)
		`(progn
			(setq ,(car vars) NIL) 
			(bulk-init ,(cdr vars))
		)
	)
)

; define query variables
(bulk-define (logograms left-to-right abjad cyrulic accents))
; intialize query variables
(bulk-init (logograms left-to-right abjad cyrulic accents))
; define answer variables
(bulk-define-rec (yes-logograms yes-left-to-right yes-abjad yes-cyrulic yes-accents))
; initialize answer variables
(bulk-init-rec (yes-logograms yes-left-to-right yes-abjad yes-cyrulic yes-accents))

; function clearing all query variables
(defun init()
	(bulk-init (logograms left-to-right abjad cyrulic accents))
)

; funciton clearing all answer variables
(defun clear-answers()
	(bulk-init-rec (yes-logograms yes-left-to-right yes-abjad yes-cyrulic yes-accents))
)

; function querying user input
(defun query(question)
	(y-or-n-p question)
)

; function defining functions for various attribute lookups
(defmacro make-attribute(attribute-name yes-var var question)
	`(defun ,attribute-name()
		(if ,var
			,yes-var
			(progn
				(setq ,var T)
				(if (query ,question)
					(setq ,yes-var T)
					(setq ,yes-var NIL)
				)
				,yes-var
			)
		)
	)
)

; create attribute functions
(make-attribute ask-logograms yes-logograms logograms "Does the language use logograms?")
(make-attribute ask-left-to-right yes-left-to-right left-to-right "Is the language writter from left to right?")
(make-attribute ask-abjad yes-abjad abjad "Does the language use the abjad?")
(make-attribute ask-cyrulic yes-cyrulic cyrulic "Does the language use the cyrulic alphabet?")
(make-attribute ask-accents yes-accents accents "Does the language contain accents?")

; chinese attributes definition
(defun chinese()
	(ask-logograms)
)

; arabic attributes definition
(defun arabic()
	(and (ask-left-to-right) (ask-abjad))
)

; hebrew attributes definition
(defun hebrew()
	(ask-left-to-right)
)

; russian attributes definition
(defun russian()
	(ask-cyrulic)
)

; french attributes definition
(defun french()
	(ask-accents)
)

; german attributes definition
(defun german()
	T
)

; initialize languages
(setq engine '(("chinese" chinese)("arabic" arabic)("hebrew" hebrew)("russian" russian)("french" french)("german" german)))

; main function
(defun start()
	(dolist(v engine)
		(if (funcall (second v))
			(progn
				(print (first v))
				(init)
				(clear-answers)
				(return)
			)
		)
	)
)