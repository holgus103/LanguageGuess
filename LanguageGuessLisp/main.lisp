(defstruct language
	name
	logograms
	left-to-right
	abjad
	cyrulic
	accents
)

(defmacro lang(name logograms ltr abjad cyrulic acc)
	(make-language :name name :logograms logograms :left-to-right ltr :abjad abjad :cyrulic cyrulic :accents acc)
)

(defmacro createSplit(attribute)
	`(defun split(a splits)
		(if (,attribute a)
			(push a (first splits))
			(push a (second splits))
		)
	splits
	)
)
(defvar languages)

(setq languages `(
	,(lang "chinese" T NIL NIL NIL NIL)
	,(lang "arabic" NIL T T NIL NIL)
	,(lang "hebrew" NIL T NIL NIL NIL)
	,(lang "russian" NIL NIL NIL T NIL)
	,(lang "french" NIL NIL NIL NIL T)
	,(lang "french" NIL NIL NIL NIL NIL)
	)
)

;(reduce (createSplit eval) '(T T T NIL) :initial-value (list nil nil) :from-end T)

(reduce (createSplit language-logograms) languages :initial-value (list nil nil) :from-end T)
