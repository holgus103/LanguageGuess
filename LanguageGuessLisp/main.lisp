; variables for storing information whether a question has been asked already
(defvar logograms)
(defvar left-to-right)
(defvar abjad)
(defvar cyrulic)
(defvar accents)

(defun init()
	(setq logograms NIL)
	(setq left-to-right NIL)
	(setq abjad NIL)
	(setq cyrulic NIL)
	(setq accents NIL)
)

; define store variables\
(defvar yes-logograms)
(defvar yes-left-to-right)
(defvar yes-abjad)
(defvar yes-cyrulic)
(defvar yes-accents)


(defun clear-answers()
	(setq yes-logograms NIL)
	(setq yes-left-to-right NIL)
	(setq yes-abjad NIL)
	(setq yes-cyrulic NIL)
	(setq yes-accents NIL)
)

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

(defun chinese()
	(ask-logograms)
)

(defun start
	dolist
)

(defun query(question)
	(y-or-n-p question)
)